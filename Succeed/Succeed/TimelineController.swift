
import UIKit
import CoreData

class TimelineController: TitleViewController,UITableViewDataSource,UITableViewDelegate,NSFetchedResultsControllerDelegate {
    
    var projects:[MyProjectMO] = []
    var fetchResultController: NSFetchedResultsController<MyProjectMO>!

    @IBOutlet weak var timelineTableView: UITableView!
    
    var myColor:UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let fetchRequest:NSFetchRequest<MyProjectMO> = MyProjectMO.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            let context = appDelegate.persistentContainer.viewContext
            fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            fetchResultController.delegate = self
            do{
                try fetchResultController.performFetch()
                if let fetchedObjects = fetchResultController.fetchedObjects{
                    projects = fetchedObjects
                }
            }catch{
                print(error)
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let timelineCell = tableView.dequeueReusableCell(withIdentifier: "timelineCell", for: indexPath) as! TimelineCell
        
        timelineCell.timelineName.text = projects[indexPath.row].name
        timelineCell.timelineName.textColor = UIColor.red
        timelineCell.timelineTime.text = dateToString( yourDate: projects[indexPath.row].date as! Date ,yourFormat: "yyyy-MM-dd HH:mm")
        timelineCell.timelineBackImg.image = UIImage(data: projects[indexPath.row].image as! Data)
        timelineCell.timelineBackImg.contentMode = .scaleAspectFill
        timelineCell.timelineBackImg.setup(gradientColor: UIColor(red: 0.95, green: 0.35, blue: 0.14, alpha: 1) )
        
        return timelineCell
    }
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "hasViewedWalkthrough"){
            return
        }
        if let pageViewController = storyboard?.instantiateViewController(withIdentifier: "WalkthroughController") as? WalkthroughPageViewController{
            present(pageViewController, animated: true, completion: nil)
        }

    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: {
            (action, indexPath) -> Void in
            if let appDeletate = (UIApplication.shared.delegate as? AppDelegate){
                let context = appDeletate.persistentContainer.viewContext
                let projectToDelete = self.fetchResultController.object(at: indexPath)
                context.delete(projectToDelete)
                appDeletate.saveContext()
            }
        })
        deleteAction.backgroundColor = UIColor(red: 202/255, green: 202/255, blue: 203/255, alpha: 1)
        return [deleteAction]
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            projects.remove(at: indexPath.row)
        }
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }
    
    func buttonConfig(sender: UIButton){
        print(sender.tag)
    }
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .delete:
            if let indexPath = indexPath{
                timelineTableView.deleteRows(at: [indexPath], with: .fade)
            }
        default:
            timelineTableView.reloadData()
        }
        if let fetchedObjects = controller.fetchedObjects{
            projects = fetchedObjects as! [MyProjectMO]
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTimelineDetail"{
            if let indexPath = timelineTableView.indexPathForSelectedRow{
                let destinationVC = segue.destination as! TimelineDetailController
                destinationVC.projectName = projects[indexPath.row].name!
                destinationVC.projectDate = dateToString( yourDate: projects[indexPath.row].date as! Date ,yourFormat: "yyyy-MM-dd HH:mm")
                destinationVC.projectImage = UIImage(data: projects[indexPath.row].image as! Data)
            }
        }
    }
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        timelineTableView.endUpdates()
    }
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        timelineTableView.beginUpdates()
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
