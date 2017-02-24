

import UIKit

class WalkthroughContentViewController: UIViewController {
    @IBOutlet weak var pageViewImage: UIImageView!

    @IBOutlet weak var pageViewText: UILabel!
    
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    var index = 0
    var imageFile = ""
    var label = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageViewImage.image = UIImage(named: imageFile)
        pageViewText.text = label
        pageControl.currentPage = index
        switch index {
        case 0...2:
            forwardButton.setTitle("NEXT", for: .normal)
        case 3:
            forwardButton.setTitle("DONE", for: .normal)
        default:
            break
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        switch index {
        case 0...2:
            let pageViewController = parent as! WalkthroughPageViewController
            pageViewController.forward(index: index)
        case 3:
            dismiss(animated: true, completion: nil)
            UserDefaults.standard.set(true, forKey: "hasViewedWalkthrough")
        default:
            break
        }
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
