
import UIKit

class NoticeController: TitleViewController,UITableViewDataSource,UITableViewDelegate {
    var noticeName = ["TOEIC Exam","MOLD Analyze"]
    var noticeColor = [UIColor.red,UIColor.blue]
    
    @IBOutlet weak var noticeTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let color1 = UIColor(red: 0.95, green: 0.35, blue: 0.14, alpha: 1)
        
        let color2 = UIColor(red: 0.97, green: 0.58, blue: 0.12, alpha: 1)
        
        let gradient = CAGradientLayer()
        gradient.frame = self.view.frame
        gradient.colors = [color1.cgColor,color2.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
//        self.view.layer.insertSublayer(gradient, at: 0)
        noticeTable.layer.insertSublayer(gradient, at: 0)
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticeColor.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let noticeCell = tableView.dequeueReusableCell(withIdentifier: "noticeCell", for: indexPath) as! NoticeCell
        noticeCell.noticeName.text = noticeName[indexPath.row]
        noticeCell.noticeColor.fillColor = noticeColor[indexPath.row]
        
        let color1 = UIColor(red: 0.95, green: 0.35, blue: 0.14, alpha: 1)
        
        let color2 = UIColor(red: 0.97, green: 0.58, blue: 0.12, alpha: 1)
        
        let gradient = CAGradientLayer()
        gradient.frame = self.view.frame
        gradient.colors = [color1.cgColor,color2.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
//        self.view.layer.insertSublayer(gradient, at: 0)
        noticeCell.layer.insertSublayer(gradient, at: 0)
        return noticeCell
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
