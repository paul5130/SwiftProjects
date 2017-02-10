//
//  WalkthroughContentViewController.swift
//  Succeed
//
//  Created by Paul Wen on 2017/1/31.
//  Copyright © 2017年 Paul Wen. All rights reserved.
//

import UIKit

class WalkthroughContentViewController: UIViewController {
    @IBOutlet weak var pageViewImage: UIImageView!

    @IBOutlet weak var pageViewText: UILabel!
    
    var index = 0
    var imageFile = ""
    var label = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageViewImage.image = UIImage(named: imageFile)
        pageViewText.text = label
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
