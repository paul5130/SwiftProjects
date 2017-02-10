
import UIKit

class WalkthroughPageViewController: UIPageViewController,UIPageViewControllerDataSource {
    
    var pageImages = ["PageView1","PageView2","PageView3","PageView4"]
    var pageLabels = ["",
                      "Many stuff in your daily life?",
                      "Simply view your work on timeline",
                      "Always keep noting you in everywhere"]
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        // Do any additional setup after loading the view.
        if let startingViewController = contentViewController(at: 0){
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughContentViewController).index
        index += 1
        return contentViewController(at: index)
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughContentViewController).index
        index -= 1
        return contentViewController(at: index)
    }
    
    func contentViewController(at index: Int) -> WalkthroughContentViewController?{
        if index < 0 || index >= pageImages.count{
            return nil
        }
        if let pageContentViewController = storyboard?.instantiateViewController(withIdentifier: "WalkthroughContentViewcontroller") as?WalkthroughContentViewController{
            pageContentViewController.index = index
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.label = pageLabels[index]
            return pageContentViewController
        }
        return nil
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
