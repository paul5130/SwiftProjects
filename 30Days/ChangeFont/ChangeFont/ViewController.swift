//
//  ViewController.swift
//  ChangeFont
//
//  Created by Paul Wen on 2016/10/20.
//  Copyright © 2016年 Paul Wen. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var fontTableView: UITableView!
    
    @IBOutlet weak var btnChangeFont: UIButton!
    
    var data = ["30 Days Swift", "增肌減脂好難好難", "尋找一起跑步一起減脂的夥伴", "我要去嘉明湖！！！", "呵呵，再见🤗", "FB:paul5130@hotmail.com",
                "line:paul5130",
                "Android 和 iOS",
                "Paul",
                "@@@@@@"]
    
    var fontNames = ["bansheepilotengrave", "galant", "KlavikaArrows-Bold", "Mechanization", "spartaco"]
    
    var fontRowIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fontTableView.dataSource = self
        fontTableView.delegate = self
        for family in UIFont.familyNames{
            for font in UIFont.fontNames(forFamilyName: family){
                print(font)
            }
        }
        btnChangeFont.layer.cornerRadius = 65
    }

    @IBAction func btnChange(_ sender: AnyObject) {
        fontRowIndex = (fontRowIndex + 1) % 5
        fontTableView.reloadData()
        print(fontNames[fontRowIndex])
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fontTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let text = data[indexPath.row]
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.blue
        cell.textLabel?.font = UIFont(name: self.fontNames[fontRowIndex], size: 16)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

}

