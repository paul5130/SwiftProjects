

import UIKit

class TimelineDetailController: UIViewController {
    var projectName:String = "TOEIC EXAM"
    var projectDate:String = "WED,02,15,2017"
    var projectImage:UIImage? = UIImage(named: "picDictionary.png")
    
    @IBOutlet weak var timelineImage: UIImageView!
    
    @IBOutlet weak var timelineTopic: UILabel!
    
    @IBOutlet weak var timelineTime: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timelineImage.image = projectImage
        timelineTopic.text = projectName
        timelineTime.text = projectDate
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
