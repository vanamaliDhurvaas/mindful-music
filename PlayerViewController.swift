//
//  PlayerViewController.swift
//  MusicApp
//
//  Created by Vanamali Dhurvaas on 6/27/22.
//

import AVFoundation
import UIKit

class PlayerViewController: UIViewController
{


    public var position: Int = 0
    public var songs: [Song] = []
    
    
    @IBOutlet var holder: UIView!
    @IBOutlet var nameLabel: UILabel!

    var player: AVAudioPlayer?
    var player2: AVAudioPlayer?
    
    // User Interface Elements
    
    private let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let playPauseButton = UIButton()
    
    private let songNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0 //line wrap
        return label
    }()
    
    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0 //line wrap
        return label
    }()
    
    private let albumNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0 //line wrap
        return label
    }()
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        if holder.subviews.count == 0
        {
            configure()
        }
        else
        {
            print("Not Working")
        }
    }

    func configure()
    {
        //set up player
        let song = songs[position]
        
        let urlString = Bundle.main.path(forResource: song.trackname, ofType: "mp3")

        do
        {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

            guard let urlString = urlString else
            {
                print("urlstring is nil")
                return
            }

            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            
            player?.numberOfLoops = -1

            guard let player = player else {
                print("player is nil")
                return
            }
            player.volume = 0.5

            player.play()
        }
        catch
        {
            print("error occured")
        }

        //set up user interface elements
        
        //album cover
        albumImageView.frame = CGRect(x: 10,
                                      y: 50,
                                      width: holder.frame.size.width-20,
                                      height: holder.frame.size.width-20)
        albumImageView.image = UIImage(named: song.imageName)
        holder.addSubview(albumImageView)
        
        //Labels: Song name, album, artist
        songNameLabel.frame = CGRect(x: 45,
                                     y: albumImageView.frame.size.height + 140,
                                     width: holder.frame.size.width-20,
                                     height: 70)
        
        albumNameLabel.frame = CGRect(x: 45,
                                     y: albumImageView.frame.size.height + 10 + 160,
                                     width: holder.frame.size.width-20,
                                     height: 70)
        
        artistNameLabel.frame = CGRect(x: 10,
                                      y: albumImageView.frame.size.height - 400,
                                      width: holder.frame.size.width-20,
                                      height: 70)
        
        
        songNameLabel.text = song.name
        albumNameLabel.text = song.albumName
        artistNameLabel.text = song.artistName

        
        songNameLabel.textAlignment = .left
        songNameLabel.font = UIFont(name: "Futura-Bold", size: 18)
        albumNameLabel.font = UIFont(name: "Futura", size: 16)
        artistNameLabel.font = UIFont(name: "Verdana-Bold", size: 20)
        albumNameLabel.textAlignment = .left
        
        holder.addSubview(songNameLabel)
        holder.addSubview(albumNameLabel)
        holder.addSubview(artistNameLabel)

        //Player Controls
        let nextButton = UIButton()
        let backButton = UIButton()
        let lowVol = UIButton()
        let highVol = UIButton()
//        let breathButton = UIButton()
//        let breathOffButton = UIButton()
        
        //Frame
        let size: CGFloat = 70
        let volSize: CGFloat = 30
        
        playPauseButton.frame = CGRect(x: (holder.frame.size.width - size) / 2.0,
                                       y: 700,
                                       width: size,
                                       height: size)
        nextButton.frame = CGRect(x: holder.frame.size.width - size - 20,
                                  y: 700,
                                  width: size,
                                  height: size)
        backButton.frame = CGRect(x: 20,
                                  y: 700,
                                  width: size,
                                  height: size)
        lowVol.frame = CGRect(x: 12,
                              y: 634,
                              width: volSize,
                              height: volSize)
        highVol.frame = CGRect(x: holder.frame.size.width - size + 30,
                               y: 634,
                               width: volSize,
                               height: volSize)
        
//        breathButton.frame = CGRect(x: holder.frame.size.width - size - 70,
//                                    y: 450,
//                                    width: 40,
//                                    height: 40)
//        breathOffButton.frame = CGRect(x: holder.frame.size.width - size - 20,
//                                    y: 450,
//                                    width: 40,
//                                    height: 40)
        
        
        //Add actions
        playPauseButton.addTarget(self, action: #selector(didTapPlayPauseButton), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
//        breathButton.addTarget(self, action: #selector(didTapBreathButton), for: .touchUpInside)
//        breathOffButton.addTarget(self, action: #selector(didTapBreathOffButton), for: .touchUpInside)
        
        
        //Styling
        playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        backButton.setBackgroundImage(UIImage(systemName: "backward.fill"), for: .normal)
        nextButton.setBackgroundImage(UIImage(systemName: "forward.fill"), for: .normal)
        lowVol.setBackgroundImage(UIImage(systemName: "volume"), for: .normal)
        highVol.setBackgroundImage(UIImage(systemName: "volume.3"), for: .normal)
//        breathButton.setBackgroundImage(UIImage(systemName: "play.circle.fill"), for: .normal)
//        breathOffButton.setBackgroundImage(UIImage(systemName: "stop.circle.fill"), for: .normal)
        
        playPauseButton.tintColor = .black
        backButton.tintColor = .black
        nextButton.tintColor = .black
//        breathButton.tintColor = .green
//        breathButton.tintColor = .red

        
        holder.addSubview(playPauseButton)
        holder.addSubview(backButton)
        holder.addSubview(nextButton)
        holder.addSubview(lowVol)
        holder.addSubview(highVol)
//        holder.addSubview(breathButton)
//        holder.addSubview(breathOffButton)


        //slider
        let slider = UISlider(frame: CGRect(x: 40,
                                            y: holder.frame.size.height-180,
                                            width: holder.frame.size.width-80,
                                            height: 50))

        slider.value = 0.5
        slider.addTarget(self, action: #selector(didSlideSlider(_:)), for: .valueChanged)
        holder.addSubview(slider)
    }
    
//    @objc func didTapBreathButton()
//    {
//        let song = songs[position]
//        
//        let urlString = Bundle.main.path(forResource: song.trackname, ofType: "mp3")
//        
//        let urlString2 = Bundle.main.path(forResource: "breath", ofType: "mp3")
//
//        do
//        {
//            try AVAudioSession.sharedInstance().setMode(.default)
//            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
//
//            guard let urlString = urlString else
//            {
//                print("urlstring is nil")
//                return
//            }
//            guard let urlString2 = urlString2 else
//            {
//                print("urlstring2 is nil")
//                return
//            }
//
//            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
//            player2 = try AVAudioPlayer(contentsOf: URL(string: urlString2)!)
//
//            player?.numberOfLoops = -1
//            player2?.numberOfLoops = -1
//            guard let player = player else
//            {
//                print("player is nil")
//                return
//            }
//            guard let player2 = player2 else
//            {
//                print("Player2 is nil")
//                return
//            }
//
//            player.volume = 0.5
//            player2.volume = 0.5
//
//            player.play()
//            player2.play()
//        }
//        catch
//        {
//            print("error occured")
//        }
//    }
//    
//    @objc func didTapBreathOffButton()
//    {
//        if player2?.isPlaying == true
//        {
//            //pause
//            player2?.pause()
//            
//        }
//        else
//        {
//            //play
//            player?.play()
//        }
//    }
    
    
    @objc func didTapBackButton()
    {
        if position > 0
        {
            position = position - 1
            player?.stop()
            for subview in holder.subviews {
                subview.removeFromSuperview()
            }
            configure()
        }
    }
    
    @objc func didTapNextButton()
    {
        if position < (songs.count - 1)
        {
            position = position + 1
            player?.stop()
            for subview in holder.subviews {
                subview.removeFromSuperview()
            }
            configure()
        }
    }
    
    @objc func didTapPlayPauseButton()
    {
        if player?.isPlaying == true
        {
            //pause
            player?.pause()
            //show play button
            playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
            
            //shrink image
            UIView.animate(withDuration: 0.2, animations: {
                self.albumImageView.frame = CGRect(x: 30,
                                                   y: 50,
                                                   width: self.holder.frame.size.width-60,
                                                   height: self.holder.frame.size.width-60)
            })
        }
        else
        {
            //play
            player?.play()
            playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
            
            //increase image size
            UIView.animate(withDuration: 0.2, animations: {
                self.albumImageView.frame = CGRect(x: 10,
                                                   y: 50,
                                                   width: self.holder.frame.size.width-20,
                                                   height: self.holder.frame.size.width-20)
            })
        }
    }
    
    
    
    @objc func didSlideSlider(_ slider: UISlider)
    {
        let value = slider.value
        player?.volume = value
        //adjust player volume
    }

    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        if let player = player
        {
            player.play()
        }
    }
}
