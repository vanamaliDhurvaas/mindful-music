//
//  ChillMusicViewController.swift
//  MusicApp
//
//  Created by Vanamali Dhurvaas on 7/15/22.
//

import UIKit
import AVFAudio

class ChillMusicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet var table: UITableView!
    @IBOutlet weak var holder: UIView!
    
    var dateNow = ""
    
    var player: AVAudioPlayer?
    var player2: AVAudioPlayer?
    var player3: AVAudioPlayer?
    var player4: AVAudioPlayer?
    var player5: AVAudioPlayer?
    var player6: AVAudioPlayer?
    var player7: AVAudioPlayer?
    var player8: AVAudioPlayer?
    
    var songs = [Song]()
    
    public var position: Int = 0
    
    var timer = Timer()
    var timer2 = Timer()
    var seconds = 01
    var minutes = 20
    var hours = 00
    
    public var hiddenSeconds = 02
    public var hiddenMinutes = 00
    public var hiddenHours = 00
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
        table.allowsMultipleSelection = true
        
        updateTheDate()
        
        Timer.scheduledTimer(timeInterval: 0.1,
                             target: self,
                             selector: #selector(updateTheDate),
                             userInfo: nil,
                             repeats: true)
        
        
        
        var value = UserDefaults.standard.integer(forKey: "hiddenMinData3")
        
        if value != nil
        {
            hiddenMinutes = value
            hiddenMinutesLabel.text = String(hiddenMinutes)

            //let value: Int? = Int(medMinLabel.text!)
            //medMinLabel.text = value +
            print("Work")
        }
        else
        {
            hiddenMinutesLabel.text = "0"
            print("No Work")
        }
            
        var value2 = UserDefaults.standard.integer(forKey: "hiddenSecData3")
        
        if value2 != nil
        {
            hiddenSeconds = value2
            hiddenSecondsLabel.text = String(hiddenSeconds)

            //let value: Int? = Int(medMinLabel.text!)
            //medMinLabel.text = value +
            print("Work")
        }
        else
        {
            hiddenSecondsLabel.text = "0"
            print("No Work")
        }
        
        var value3 = UserDefaults.standard.integer(forKey: "hiddenHourData3")
        if value3 != nil
        {
            hiddenHours = value3
            hiddenHoursLabel.text = String(hiddenHours)

            //let value: Int? = Int(medMinLabel.text!)
            //medMinLabel.text = value +
            //print("Work")
        }
        else
        {
            hiddenHoursLabel.text = "0"
            print("No Work")
        }
        
        let manager = FileManager.default

        guard let url = manager.urls(for: .documentDirectory,
                                     in: .userDomainMask).first else {
            return
        }
        
//        let fileUrl = url.appendingPathComponent("updatingDateFolder").appendingPathComponent("chillDate.txt")
//        let data = "7/24/22".data(using: .utf8)
//
//        manager.createFile(atPath: fileUrl.path,
//                           contents: data,
//                           attributes: [FileAttributeKey.creationDate: Date()])
        
        let folderUrl = url.appendingPathComponent("updatingDateFolder")
        let fileUrl = folderUrl.appendingPathComponent("chillDate.txt")
        do {
        let todos = try String(contentsOf: fileUrl)

//        for todo in todos.split(separator: ";") {
//
            if todos != dateNow
            {
                    hiddenSeconds = 2
                    hiddenMinutes = 0
                    hiddenHours = 0
            }
            else
            {
                print("Date IS Correct")
            }
            
        //print(todo)
//        }
        } catch {
        print(error.localizedDescription)
        }
        
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @objc func updateTheDate()
    {
        dateNow = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: DateFormatter.Style.short, timeStyle: DateFormatter.Style.none)
    }
    
    @IBAction func startStopAction(_ sender: UIButton)
    {
        
    }
    
    
    
    func configureSongs()
    {
        songs.append(Song(name: "Chill Indian Music",
                          albumName: "Chill Music",
                          artistName: "Mindful Music",
                          imageName: "chillPic",
                          trackname: "chillIndia"))
        
        songs.append(Song(name: "Lofi Hip-Hop Music",
                          albumName: "Chill Music",
                          artistName: "Mindful Music",
                          imageName: "chillPic",
                          trackname: "lofi"))
        
        songs.append(Song(name: "Zone Out",
                          albumName: "Chill Music",
                          artistName: "Mindful Music",
                          imageName: "chillPic",
                          trackname: "zone"))
        
        songs.append(Song(name: "Chill Study Music",
                          albumName: "Chill Music",
                          artistName: "Mindful Music",
                          imageName: "chillPic",
                          trackname: "study"))
        
        songs.append(Song(name: "Aesthetic Music",
                          albumName: "Chill Music",
                          artistName: "Mindful Music",
                          imageName: "chillPic",
                          trackname: "aes"))
    }

    //Table

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId12") as! UITableViewCell
        let song = songs[indexPath.row]
        //configure
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        let mySwitch = UISwitch(frame: .zero)
        mySwitch.setOn(false, animated: true)
        mySwitch.tag = indexPath.row
        mySwitch.addTarget(self, action: #selector(self.didChangeSwitch(_:)), for: .valueChanged)
        cell.accessoryView = mySwitch
        //cell.accessoryType = disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)

        return cell
    }
    
    @objc func didChangeSwitch(_ sender: UISwitch!)
    {
        
        print("Table Row \(sender.tag)")
        print("The Switch is \(sender.isOn ? "ON" : "Off")")
        
        if sender.isOn && sender.tag == 0
        {
            let urlString = Bundle.main.path(forResource: "chillIndia", ofType: "mp3")
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
        }
        else if sender.isOn && sender.tag == 1
        {
            let urlString = Bundle.main.path(forResource: "lofi", ofType: "mp3")
            do
            {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

                guard let urlString = urlString else
                {
                    print("urlstring is nil")
                    return
                }

                player2 = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
                
                player2?.numberOfLoops = -1

                guard let player2 = player2 else {
                    print("player is nil")
                    return
                }
                player2.volume = 0.5

                player2.play()
            }
            catch
            {
                print("error occured")
            }
        }
        else if sender.isOn && sender.tag == 2
        {
            let urlString = Bundle.main.path(forResource: "zone", ofType: "mp3")
            do
            {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

                guard let urlString = urlString else
                {
                    print("urlstring is nil")
                    return
                }

                player3 = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
                
                player3?.numberOfLoops = -1

                guard let player3 = player3 else {
                    print("player is nil")
                    return
                }
                player3.volume = 0.5

                player3.play()
            }
            catch
            {
                print("error occured")
            }
        }
        else if sender.isOn && sender.tag == 3
        {
            let urlString = Bundle.main.path(forResource: "study", ofType: "mp3")
            do
            {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

                guard let urlString = urlString else
                {
                    print("urlstring is nil")
                    return
                }

                player4 = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
                
                player4?.numberOfLoops = -1

                guard let player4 = player4 else {
                    print("player is nil")
                    return
                }
                player4.volume = 0.5

                player4.play()
            }
            catch
            {
                print("error occured")
            }
        }
        else if sender.isOn && sender.tag == 4
        {
            let urlString = Bundle.main.path(forResource: "aes", ofType: "mp3")
            do
            {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

                guard let urlString = urlString else
                {
                    print("urlstring is nil")
                    return
                }

                player5 = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
                
                player5?.numberOfLoops = -1

                guard let player5 = player5 else {
                    print("player is nil")
                    return
                }
                player5.volume = 0.5

                player5.play()
            }
            catch
            {
                print("error occured")
            }
        }
        else
        {
            if player?.isPlaying == true && sender.tag == 0
            {
                //pause
                player?.pause()

            }
            else if player2?.isPlaying == true && sender.tag == 1
            {
                //pause
                player2?.pause()

            }
            else if player3?.isPlaying == true && sender.tag == 2
            {
                //pause
                player3?.pause()

            }
            else if player4?.isPlaying == true && sender.tag == 3
            {
                //pause
                player4?.pause()

            }
            else if player5?.isPlaying == true && sender.tag == 4
            {
                //pause
                player5?.pause()

            }
            else
            {
                //play
                player?.play()
                player2?.play()
                player3?.play()
                player4?.play()
                player5?.play()
            }
            print("Its now off")
        }
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)



        //present the player
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "player") as? PlayerViewController else {
            return
        }
        vc.songs = songs
        vc.position = position

        present(vc, animated: true)

    }
    // User Interface Elements
    
    
    private let secondsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0 //line wrap
        return label
    }()
    private let minutesLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0 //line wrap
        return label
    }()
    private let hoursLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0 //line wrap
        return label
    }()
    
    private let colonLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0 //line wrap
        return label
    }()
    
    private let colon2Label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0 //line wrap
        return label
    }()
    
    private let hiddenSecondsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0 //line wrap
        return label
    }()
    private let hiddenMinutesLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0 //line wrap
        return label
    }()
    private let hiddenHoursLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0 //line wrap
        return label
    }()
    
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
        
        //set up user interface elements
        
        //album cover
        
        //Labels: Song name, album, artist
        secondsLabel.frame = CGRect(x: 35,
                                  y: 0,
                                  width: holder.frame.size.width-20,
                                  height: 70)
        minutesLabel.frame = CGRect(x: 10,
                                  y: 0,
                                  width: holder.frame.size.width-20,
                                  height: 70)
        hoursLabel.frame = CGRect(x: -15,
                                  y: 0,
                                  width: holder.frame.size.width-20,
                                  height: 70)
        
        colonLabel.frame = CGRect(x: -2.5,
                                  y: 0,
                                  width: holder.frame.size.width-20,
                                  height: 70)
        
        colon2Label.frame = CGRect(x: 22.5,
                                  y: 0,
                                  width: holder.frame.size.width-20,
                                  height: 70)
        
        hiddenSecondsLabel.frame = CGRect(x: 30,
                                  y: 20,
                                  width: holder.frame.size.width-20,
                                  height: 70)
        hiddenMinutesLabel.frame = CGRect(x: 10,
                                  y: 20,
                                  width: holder.frame.size.width-20,
                                  height: 70)
        hiddenHoursLabel.frame = CGRect(x: -10,
                                  y: 20,
                                  width: holder.frame.size.width-20,
                                  height: 70)
        
        
        secondsLabel.text = "00"
        minutesLabel.text = "20"
        hoursLabel.text = "00"
        
        colonLabel.text = ":"
        colon2Label.text = ":"
        
        hiddenSecondsLabel.text = "00"
        hiddenMinutesLabel.text = "00"
        hiddenHoursLabel.text = "00"
        
        
        hiddenSecondsLabel.textColor = .green
        hiddenMinutesLabel.textColor = .green
        hiddenHoursLabel.textColor = .green
        
        
        
        holder.addSubview(secondsLabel)
        holder.addSubview(minutesLabel)
        holder.addSubview(hoursLabel)
        
        holder.addSubview(colonLabel)
        holder.addSubview(colon2Label)

        
        holder.addSubview(hiddenSecondsLabel)
        holder.addSubview(hiddenMinutesLabel)
        holder.addSubview(hiddenHoursLabel)
        


        
        //Player Controls
        let timerStartButton = UIButton()
        let timerStopButton = UIButton()
        let timerResetButton = UIButton()
        let timerUpButton = UIButton()
        let timerDownButton = UIButton()
        
        //Frame
        let size: CGFloat = 70
        
        timerStartButton.frame = CGRect(x: holder.frame.size.width - size - 220,
                                        y: 70,
                                        width: 50,
                                        height: 50)
        timerStopButton.frame = CGRect(x: holder.frame.size.width - size - 160,
                                            y: 70,
                                            width: 50,
                                            height: 50)
        timerResetButton.frame = CGRect(x: holder.frame.size.width - size - 100,
                                        y: 70,
                                        width: 50,
                                        height: 50)
        timerUpButton.frame = CGRect(x: holder.frame.size.width - size - 250,
                                     y: 20,
                                     width: 40,
                                     height: 40)
        timerDownButton.frame = CGRect(x: holder.frame.size.width - size - 70,
                                     y: 20,
                                     width: 40,
                                     height: 40)
        
        
        //Add actions
        timerStartButton.addTarget(self, action: #selector(didTapTimerStartButton), for: .touchUpInside)
        timerStopButton.addTarget(self, action: #selector(didTapTimerStopButton), for: .touchUpInside)
        timerResetButton.addTarget(self, action: #selector(didTapTimerResetButton), for: .touchUpInside)
        timerUpButton.addTarget(self, action: #selector(didTapTimerUpButton), for: .touchUpInside)
        timerDownButton.addTarget(self, action: #selector(didTapTimerDownButton), for: .touchUpInside)
        
        //Styling
        timerStartButton.setBackgroundImage(UIImage(systemName: "play.circle"), for: .normal)
        timerStopButton.setBackgroundImage(UIImage(systemName: "stop.circle"), for: .normal)
        timerResetButton.setBackgroundImage(UIImage(systemName: "restart.circle"), for: .normal)
        timerUpButton.setBackgroundImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        timerDownButton.setBackgroundImage(UIImage(systemName: "minus.circle.fill"), for: .normal)
        
        timerStopButton.tintColor = .black
        timerStartButton.tintColor = .black
        timerResetButton.tintColor = .black
        timerUpButton.tintColor = .black
        timerDownButton.tintColor = .black

        
        holder.addSubview(timerStopButton)
        holder.addSubview(timerStartButton)
        holder.addSubview(timerResetButton)
        holder.addSubview(timerUpButton)
        holder.addSubview(timerDownButton)


    }
    
    
    
    @objc func didTapTimerStartButton()
    {
        //makesure no other timers are running
        timer.invalidate()
        timer2.invalidate()
        //Create timer
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(NatureViewController.timerClass), userInfo: nil,
                                     repeats: true)
        timer2 = Timer.scheduledTimer(timeInterval: 1,
                                      target: self,
                                      selector: #selector(ChineseViewController.timerClass2),
                                      userInfo: nil,
                                      repeats: true)
    }
    
    @objc func didTapTimerStopButton()
    {
        timer.invalidate()
//        UserDefaults.standard.set(hiddenMinutes, forKey: "hiddenMinData")
//        UserDefaults.standard.set(hiddenSeconds, forKey: "hiddenSecData")
        timer2.invalidate()
    }
    
    @objc func didTapTimerResetButton()
    {
        timer.invalidate()
        timer2.invalidate()
        hours = 00
        minutes = 20
        seconds = 00
        secondsLabel.text = String(seconds)
        minutesLabel.text = String(minutes)
        hoursLabel.text = String(hours)

    }
    @objc func didTapTimerUpButton()
    {
        minutes = minutes + 1
        minutesLabel.text = String(minutes)
        if (minutes == 60)
        {
            hours += 1
            hoursLabel.text = String(hours)
            minutes = 00
            minutesLabel.text = String(minutes)
        }
    }
    @objc func didTapTimerDownButton()
    {
        minutes = minutes - 1
        minutesLabel.text = String(minutes)
        if (minutes == -1)
        {
            minutes = 00
            minutesLabel.text = String(minutes)
        }
    }
    @objc func timerClass()
    {
        
        var isRunning: Bool = false
        seconds -= 1
        
        secondsLabel.text = String(seconds)
        
        if (seconds == 0)
        {
            if (hours == 00) && (minutes == 00)
            {
                timer.invalidate()
                
            }
            else
            {
            minutes -= 1
            minutesLabel.text = String(minutes)
            seconds = 59
            secondsLabel.text = String(seconds)
            }
            
        }
        
        if (minutes == 0) && (hours > 0)
        {
            hours -= 1
            hoursLabel.text = String(hours)
            minutes = 59
            minutesLabel.text = String(minutes)
        }
        if (minutes == 0) && (hours == 0) && (seconds > 0) && (isRunning == false)
        {
            isRunning = true
            //seconds -= 1
            //seconds = 5
            secondsLabel.text = String(seconds)
        }
        if (hours == 0) && (minutes == 0) && (seconds == 0)
        {
            //print("Done")
            timer2.invalidate()
            //congratsSound()
            player?.stop()
            player2?.stop()
            player3?.stop()
            player4?.stop()
            player5?.stop()
            player6?.stop()
            player7?.stop()
            player8?.stop()
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "congrats") as? CongratsViewController else {
                return
            }

            present(vc, animated: true)
        }
    }
    @objc func timerClass2()
    {
        
        hiddenSeconds += 1
        
        hiddenSecondsLabel.text = String(hiddenSeconds)
        
        if (hiddenSeconds == 60)
        {
            hiddenMinutes += 1
            hiddenMinutesLabel.text = String(hiddenMinutes)
            hiddenSeconds = 0
            hiddenSecondsLabel.text = String(hiddenSeconds)

            
        }
        
        if (hiddenMinutes == 60)
        {
            hiddenHours += 1
            hiddenHoursLabel.text = String(hiddenHours)
            hiddenMinutes = 0
            hiddenMinutesLabel.text = String(hiddenMinutes)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if (segue.identifier == "backSegue")
        {
            player?.stop()
            player2?.stop()
            player3?.stop()
            player4?.stop()
            player5?.stop()
            player6?.stop()
            player7?.stop()
            player8?.stop()
        }
        if (segue.identifier == "finishSegue")
        {
            if (hiddenMinutesLabel.text == "00") && hiddenHoursLabel.text == "00"
            {
                showAlert()
            }
            else
            {
                let manager = FileManager.default
                
                guard let url = manager.urls(for: .documentDirectory,
                                             in: .userDomainMask).first else {
                    return
                }
                let folderUrl = url.appendingPathComponent("updatingDateFolder")
                let fileUrl = folderUrl.appendingPathComponent("chillDate.txt")
                do {
                let todos = try String(contentsOf: fileUrl)
                    if todos != dateNow
                    {
                            try dateNow.write(to: fileUrl, atomically: true, encoding: .utf8)
                    }
                    else
                    {
                        print("Date IS Correct")
                    }
                } catch {
                print(error.localizedDescription)
                }
                player?.stop()
                player2?.stop()
                player3?.stop()
                player4?.stop()
                player5?.stop()
                player6?.stop()
                player7?.stop()
                player8?.stop()
                let word5 = hiddenMinutesLabel.text!
                let word6 = hiddenHoursLabel.text!
                let nvc = segue.destination as! HomeViewController
                nvc.passedWord5 = word5
                nvc.passedWord6 = word6
                UserDefaults.standard.set(hiddenMinutesLabel.text, forKey: "myWorkMinData")
                UserDefaults.standard.set(hiddenSecondsLabel.text, forKey: "myWorkSecData")
                UserDefaults.standard.set(hiddenHoursLabel.text, forKey: "myWorkHourData")
                
                UserDefaults.standard.set(hiddenHours, forKey: "hiddenHourData3")
                UserDefaults.standard.set(hiddenMinutes, forKey: "hiddenMinData3")
                UserDefaults.standard.set(hiddenSeconds, forKey: "hiddenSecData3")
                timer2.invalidate()
            }
            
        }
    }
    func showAlert()
    {
        let alert = UIAlertController(title: "Cannot Finish Session", message: "You must do this activity for atleast one minute", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in print("Tapped Dismiss")
        }))
        present(alert, animated: true)
    }
    
    func congratsSound()
    {
        //set up player
        
//        let urlString = Bundle.main.path(forResource: "lightRain", ofType: "mp3")
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
//
//            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
//
//            player?.numberOfLoops = -1
//
//            guard let player = player else {
//                print("player is nil")
//                return
//            }
//            player.volume = 1
//
//            player.play()
//        }
//        catch
//        {
//            print("error occured")
//        }
    }
    
}
