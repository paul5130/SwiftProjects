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
    
    var data = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", "呵呵，再见🤗 See you next Project", "微博 @Allen朝辉",
                "测试测试测试测试测试测试",
                "123",
                "Alex",
                "@@@@@@"]
    
    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "edundot", "Gaspar Regular"]
    
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

