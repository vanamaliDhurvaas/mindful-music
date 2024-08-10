//
//  HomeViewController.swift
//  MusicApp
//
//  Created by Vanamali Dhurvaas on 7/6/22.
//

import UIKit

class HomeViewController: UIViewController
{
    
    @IBOutlet var viewBehind: UIView!
    
    var passedWord = ""
    var passedWord2 = ""
    var passedWord3 = ""
    var passedWord4 = ""
    var passedWord5 = ""
    var passedWord6 = ""
    var passedWord7 = ""
    var passedWord8 = ""

    var dateNow = ""
    
    @IBOutlet weak var medMinLabel: UILabel!
    @IBOutlet weak var medHourLabel: UILabel!
    @IBOutlet weak var yogaMinLabel: UILabel!
    @IBOutlet weak var yogaHourLabel: UILabel!
    @IBOutlet weak var exMinLabel: UILabel!
    @IBOutlet weak var exHourLabel: UILabel!
    @IBOutlet weak var workMinLabel: UILabel!
    @IBOutlet weak var workHourLabel: UILabel!
    
    
    var medMinInt = 0
    var yogaMinInt = 0
    var exMinInt = 0
    var workMinInt = 0
    
    var scheduledTimer: Timer!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        updateTheDate()
        
        Timer.scheduledTimer(timeInterval: 0.5,
                             target: self,
                             selector: #selector(updateTheDate),
                             userInfo: nil,
                             repeats: true)
        
        medMinLabel.text = passedWord
        medHourLabel.text = passedWord2
        yogaMinLabel.text = passedWord3
        yogaHourLabel.text = passedWord4
        workMinLabel.text = passedWord5
        workHourLabel.text = passedWord6
        exMinLabel.text = passedWord7
        exHourLabel.text = passedWord8
        
//
        var value = UserDefaults.standard.string(forKey: "myMedMinData")
        var value2 = UserDefaults.standard.string(forKey: "myMedHourData")
        var value3 = UserDefaults.standard.string(forKey: "myYogaMinData")
        var value4 = UserDefaults.standard.string(forKey: "myYogaHourData")
        var value5 = UserDefaults.standard.string(forKey: "myExMinData")
        var value6 = UserDefaults.standard.string(forKey: "myExHourData")
        var value7 = UserDefaults.standard.string(forKey: "myWorkMinData")
        var value8 = UserDefaults.standard.string(forKey: "myWorkHourData")
        
        print("\(value!) is value")
        
//
        if value != nil
        {
            medMinLabel.text = value
            if medMinLabel.text == "1"
            {
                medMinLabel.text = "01"
            }
            if medMinLabel.text == "2"
            {
                medMinLabel.text = "02"
            }
            if medMinLabel.text == "3"
            {
                medMinLabel.text = "03"
            }
            if medMinLabel.text == "4"
            {
                medMinLabel.text = "04"
            }
            if medMinLabel.text == "5"
            {
                medMinLabel.text = "05"
            }
            if medMinLabel.text == "6"
            {
                medMinLabel.text = "06"
            }
            if medMinLabel.text == "7"
            {
                medMinLabel.text = "07"
            }
            if medMinLabel.text == "8"
            {
                medMinLabel.text = "08"
            }
            if medMinLabel.text == "9"
            {
                medMinLabel.text = "09"
            }
        }
        else
        {
            medMinLabel.text = "00"
        }
        
        if value2 != nil
        {
            medHourLabel.text = value2
        }
        else
        {
            medHourLabel.text = "00"
        }
        
        if value3 != nil
        {
            yogaMinLabel.text = value3
            if yogaMinLabel.text == "1"
            {
                yogaMinLabel.text = "01"
            }
            if yogaMinLabel.text == "2"
            {
                yogaMinLabel.text = "02"
            }
            if yogaMinLabel.text == "3"
            {
                yogaMinLabel.text = "03"
            }
            if yogaMinLabel.text == "4"
            {
                yogaMinLabel.text = "04"
            }
            if yogaMinLabel.text == "5"
            {
                yogaMinLabel.text = "05"
            }
            if yogaMinLabel.text == "6"
            {
                yogaMinLabel.text = "06"
            }
            if yogaMinLabel.text == "7"
            {
                yogaMinLabel.text = "07"
            }
            if yogaMinLabel.text == "8"
            {
                yogaMinLabel.text = "08"
            }
            if yogaMinLabel.text == "9"
            {
                yogaMinLabel.text = "09"
            }
            
        }
        else
        {
            yogaMinLabel.text = "00"
        }
        
        if value4 != nil
        {
            yogaHourLabel.text = value4
        }
        else
        {
            yogaHourLabel.text = "00"
        }
        
        if value5 != nil
        {
            exMinLabel.text = value5
            if exMinLabel.text == "1"
            {
                exMinLabel.text = "01"
            }
            if exMinLabel.text == "2"
            {
                exMinLabel.text = "02"
            }
            if exMinLabel.text == "3"
            {
                exMinLabel.text = "03"
            }
            if exMinLabel.text == "4"
            {
                exMinLabel.text = "04"
            }
            if exMinLabel.text == "5"
            {
                exMinLabel.text = "05"
            }
            if exMinLabel.text == "6"
            {
                exMinLabel.text = "06"
            }
            if exMinLabel.text == "7"
            {
                exMinLabel.text = "07"
            }
            if exMinLabel.text == "8"
            {
                exMinLabel.text = "08"
            }
            if exMinLabel.text == "9"
            {
                exMinLabel.text = "09"
            }
        }
        else
        {
            exMinLabel.text = "00"
        }
        
        if value6 != nil
        {
            exHourLabel.text = value6
        }
        else
        {
            exHourLabel.text = "00"
        }
        
        if value7 != nil
        {
            workMinLabel.text = value7
            if workMinLabel.text == "1"
            {
                workMinLabel.text = "01"
            }
            if workMinLabel.text == "2"
            {
                workMinLabel.text = "02"
            }
            if workMinLabel.text == "3"
            {
                workMinLabel.text = "03"
            }
            if workMinLabel.text == "4"
            {
                workMinLabel.text = "04"
            }
            if workMinLabel.text == "5"
            {
                workMinLabel.text = "05"
            }
            if workMinLabel.text == "6"
            {
                workMinLabel.text = "06"
            }
            if workMinLabel.text == "7"
            {
                workMinLabel.text = "07"
            }
            if workMinLabel.text == "8"
            {
                workMinLabel.text = "08"
            }
            if workMinLabel.text == "9"
            {
                workMinLabel.text = "09"
            }
            
        }
        else
        {
            workMinLabel.text = "00"
        }
        
        if value8 != nil
        {
            workHourLabel.text = value8
        }
        else
        {
            workHourLabel.text = "00"
        }
        
        let manager = FileManager.default
        
        guard let url = manager.urls(for: .documentDirectory,
                                     in: .userDomainMask).first else {
            return
        }
        //let newFolderUrl = url.appendingPathComponent("updatingDateFolder")
        
        //let fileUrl = newFolderUrl.appendingPathComponent("dateStore.txt")
        //let data = "7/23/22".data(using: .utf8)
        //manager.createFile(atPath: fileUrl.path,
                           //contents: data,
                           //attributes: [FileAttributeKey.creationDate: Date()])
        
        let folderUrl = url.appendingPathComponent("updatingDateFolder")
        let fileUrl = folderUrl.appendingPathComponent("dateStore.txt")
        let medFileUrl = folderUrl.appendingPathComponent("birdDate.txt")
        let yogaFileUrl = folderUrl.appendingPathComponent("airDate.txt")
        let exFileUrl = folderUrl.appendingPathComponent("chillDate.txt")
        let workFileUrl = folderUrl.appendingPathComponent("rockDate.txt")
        do {
            let todos = try String(contentsOf: fileUrl)
            let medFileCont = try String(contentsOf: medFileUrl)
            let yogaFileCont = try String(contentsOf: yogaFileUrl)
            let exFileCont = try String(contentsOf: exFileUrl)
            let workFileCont = try String(contentsOf: workFileUrl)

//        for todo in todos.split(separator: ";") {
//
            if todos != dateNow
            {
                print("Date is not correct")
                medMinLabel.text = "00"
                yogaMinLabel.text = "00"
                exMinLabel.text = "00"
                workMinLabel.text = "00"
                value = "0"
                value2 = "0"
                value3 = "0"
                value4 = "0"
                value5 = "0"
                value6 = "0"
                value7 = "0"
                value8 = "0"
                try dateNow.write(to: fileUrl, atomically: true, encoding: .utf8)
            }
            else
            {
                print("All Right")
            }
            
            if todos == dateNow && todos != medFileCont
            {
                //print("DiffMED")
                medMinLabel.text = "00"
            }
            if todos == dateNow && todos != yogaFileCont
            {
                //print("DiffYOGA")
                yogaMinLabel.text = "00"
            }
            if todos == dateNow && todos != exFileCont
            {
                //print("DiffEX")
                exMinLabel.text = "00"
            }
            if todos == dateNow && todos != workFileCont
            {
                //print("DiffWORK")
                workMinLabel.text = "00"
            }
            
        //print(todo)
//        }
        } catch {
        print(error.localizedDescription)
        }
        
        //medMinLabel.text = medMinLabel.text
        print(medMinLabel.text)
        
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @objc func updateTheDate()
    {
        dateNow = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: DateFormatter.Style.short, timeStyle: DateFormatter.Style.none)
    }
    
    
}
