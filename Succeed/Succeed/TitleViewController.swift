
import UIKit

class TitleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIGraphicsBeginImageContext(customOrange().bounds.size)
        customOrange().render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        let rightBarItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(TitleViewController.barRightItemPressedn(_:)))
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = rightBarItem
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func barRightItemPressedn(_ sender: AnyObject)
    {
//        self.dismiss(animated: true, completion: nil);
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil);
        let NewProjectVC : AddProjectController = storyboard.instantiateViewController(withIdentifier: "AddProjectController") as! AddProjectController;
        
//        self.present(NewProjectVC, animated: true, completion: nil);
        self.navigationController?.pushViewController(NewProjectVC, animated: true)
    }
    func dateToString(yourDate: Date,yourFormat: String)-> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = yourFormat
        return dateFormatter.string(from: yourDate)
    }
    func customOrange() -> CAGradientLayer{
        let color1 = UIColor(red: 0.95, green: 0.35, blue: 0.14, alpha: 1)
        
        let color2 = UIColor(red: 0.97, green: 0.58, blue: 0.12, alpha: 1)
        
        let gradient = CAGradientLayer()
        gradient.frame = self.view.frame
        gradient.colors = [color1.cgColor,color2.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        return gradient
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
