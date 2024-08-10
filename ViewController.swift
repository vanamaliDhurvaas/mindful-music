//
//  ViewController.swift
//  MusicApp
//
//  Created by Vanamali Dhurvaas on 6/26/22.
//


// Add this to the header of your file, e.g. in ViewController.swift
import UIKit

// Add this to the body
class ViewController: UIViewController
{
    
    @IBOutlet weak var mindfulMusic: UIImageView!
    @IBOutlet weak var blueCirc: UIImageView!
    @IBOutlet weak var tapToStartButton: UIButton!
    @IBOutlet weak var tapToStartLabel: UILabel!
    
    let path = FileManager.default.urls(for: .documentDirectory,
                                        in: .userDomainMask)[0].appendingPathComponent("dateFile")
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        do
        {
            let data = try Data(contentsOf: path)
            let stringFromData = String(data: data,
                                        encoding: .utf8)
            
            print(stringFromData)
        }
        catch
        {
            print("error")
        }
        
        startFade()
        
        
        func startFade() {
            
            mindfulMusic.alpha = 0.0
            blueCirc.alpha = 0.0
            tapToStartLabel.alpha = 0.0
            
            // fade in
            UIView.animate(withDuration: 4.0, animations: {
                self.mindfulMusic.alpha = 1.0
            }) { (finished) in
            }
            
            UIView.animate(withDuration: 4.0, animations: {
                self.blueCirc.alpha = 1.0
            }) { (finished) in
            }
            
            UIView.animate(withDuration: 2.0, animations: {
                self.tapToStartButton.alpha = 0.0
            }) { (finished) in
                // fade out
                UIView.animate(withDuration: 2.0, animations: {
                    self.tapToStartButton.alpha = 1.0
                }) { (finished) in
                }
                
                UIView.animate(withDuration: 6.0, animations: {
                    self.tapToStartLabel.alpha = 1.0
                }) { (finished) in
                    // fade out
                    UIView.animate(withDuration: 2.0, animations: {
                        self.tapToStartLabel.alpha = 0.0
                    }) { (finished) in
                        UIView.animate(withDuration: 2.0, animations: {
                            self.tapToStartLabel.alpha = 1.0
                        }) { (finished) in
                            UIView.animate(withDuration: 2.0, animations: {
                                self.tapToStartLabel.alpha = 0.0
                            }) { (finished) in
                                UIView.animate(withDuration: 2.0, animations: {
                                    self.tapToStartLabel.alpha = 1.0
                                }) { (finished) in
                                    UIView.animate(withDuration: 2.0, animations: {
                                        self.tapToStartLabel.alpha = 0.0
                                    }) { (finished) in
                                        UIView.animate(withDuration: 2.0, animations: {
                                            self.tapToStartLabel.alpha = 1.0
                                        }) { (finished) in
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    
}
