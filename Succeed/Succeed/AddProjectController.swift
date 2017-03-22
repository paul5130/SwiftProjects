import UIKit
class AddProjectController: UIViewController {

    var projectData:MyProjectMO!
    
    @IBOutlet weak var projectName: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    var chooseDate = Date()
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.datePickerMode = .dateAndTime
        datePicker.minuteInterval = 15
        datePicker.locale = NSLocale(localeIdentifier: "zh_TW") as Locale
        
        datePicker.addTarget(self, action: #selector(AddProjectController.datePickerValueChange(sender:)), for: .valueChanged)
        // Do any additional setup after loading the view.
    }

    func datePickerValueChange(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        chooseDate = sender.date
        print("date select: \(dateFormatter.string(from: sender.date))")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pushToSavePage"{
            if projectName.text == ""{
                let alertController = UIAlertController(title: "Oops", message: "must input project name", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(alertAction)
                present(alertController, animated: true, completion: nil)
            }
            else{
                let destinationConroller = segue.destination as! DetailProjectController
                destinationConroller.projectDate = chooseDate
                destinationConroller.projectColorR = 0
                destinationConroller.projectColorG = 113
                destinationConroller.projectColorB = 188
                destinationConroller.projectName = projectName.text!
            }
            
        }
    }
    @IBAction func buttonPressed(sender: UIButton){
        switch sender.tag {
        case 101:
            <#code#>
        default:
            <#code#>
        }
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
