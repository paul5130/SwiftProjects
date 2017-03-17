
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
//        let leftBarItem = UIBarButtonItem(barButtonSystemItem: .undo, target: self, action: #selector(TitleViewController.barLeftItemPressedn(_:)))
//        self.navigationItem.leftBarButtonItem = leftBarItem
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func barLeftItemPressedn(_ sender: AnyObject)
    {
        self.dismiss(animated: true, completion: nil);
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
