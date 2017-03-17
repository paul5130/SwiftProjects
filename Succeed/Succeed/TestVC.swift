
import UIKit

class TestVC: TitleViewController,UITableViewDataSource,UITableViewDelegate {
    var timelineMain = ["TOEIC Exam","DRONE Project","AutoZone shooting"]
    var timelineDate = ["WED, 02, 15,2017","WED, 02, 15,2017","WED, 02, 15,2017"]
    var timelineBackground = ["picDictionary","picScrew","picFood"]
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.barTintColor = UIColor.cyan
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let timelineCell = tableView.dequeueReusableCell(withIdentifier: "timelineCell", for: indexPath) as! TimelineCell
        timelineCell.timelineName.text = timelineMain[indexPath.row]
        timelineCell.timelineTime.text = timelineDate[indexPath.row]
        timelineCell.timelineBackImg.image = UIImage(named: timelineBackground[indexPath.row])
        return timelineCell
    }
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "hasViewedWalkthrough"){
            return
        }
        //
        if let pageViewController = storyboard?.instantiateViewController(withIdentifier: "WalkthroughController") as? WalkthroughPageViewController{
            present(pageViewController, animated: true, completion: nil)
        }
        
        //
    }
    func buttonConfig(sender: UIButton){
        print(sender.tag)
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
