
import UIKit

class ViewController: TitleViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let color1 = UIColor(red: 0.95, green: 0.35, blue: 0.14, alpha: 1)
       
        let color2 = UIColor(red: 0.97, green: 0.58, blue: 0.12, alpha: 1)
        
        let gradient = CAGradientLayer()
        gradient.frame = self.view.frame
        gradient.colors = [color1.cgColor,color2.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        self.view.layer.insertSublayer(gradient, at: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

