import UIKit
class AddProjectController: UIViewController,UITextFieldDelegate {

    var projectData:MyProjectMO!
    
    @IBOutlet weak var projectName: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    var chooseDate = Date()
    var chooseColorR = 0.0
    var chooseColorG = 0.0
    var chooseColorB = 0.0
    var chooseColorTag = 102
    @IBOutlet weak var defaultColor: LittleCircle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.datePickerMode = .dateAndTime
        datePicker.minuteInterval = 15
        datePicker.locale = NSLocale(localeIdentifier: "zh_TW") as Locale
        
        datePicker.addTarget(self, action: #selector(AddProjectController.datePickerValueChange(sender:)), for: .valueChanged)
        defaultColor.backgroundColor = UIColor.gray
        self.projectName.delegate = self
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        projectName.resignFirstResponder()
        return true
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
                destinationConroller.projectColorR = chooseColorR
                destinationConroller.projectColorG = chooseColorG
                destinationConroller.projectColorB = chooseColorB
                destinationConroller.projectName = projectName.text!
            }
            
        }
    }
    @IBAction func buttonPressed(sender: UIButton){
        
        for index in 101...107{
            let button = self.view.viewWithTag(index)
            button?.backgroundColor = UIColor.clear
        }
        switch sender.tag {
        case 101:
            sender.backgroundColor = UIColor.gray
            chooseColorR = 255/255
            chooseColorG = 255/255
            chooseColorB = 255/255
            print(sender.tag)
            break
        case 102:
            sender.backgroundColor = UIColor.gray
            chooseColorR = 247/255
            chooseColorG = 147/255
            chooseColorB = 30/255
            print(sender.tag)
            break
        case 103:
            sender.backgroundColor = UIColor.gray
            chooseColorR = 255/255
            chooseColorG = 105/255
            chooseColorB = 105/255
            print(sender.tag)
            break
        case 104:
            sender.backgroundColor = UIColor.gray
            chooseColorR = 140/255
            chooseColorG = 198/255
            chooseColorB = 63/255
            print(sender.tag)
            break
        case 105:
            sender.backgroundColor = UIColor.gray
            chooseColorR = 41/255
            chooseColorG = 171/255
            chooseColorB = 226/255
            print(sender.tag)
            break
        case 106:
            sender.backgroundColor = UIColor.gray
            chooseColorR = 0
            chooseColorG = 113/255
            chooseColorB = 188/255
            print(sender.tag)
            break
        case 107:
            sender.backgroundColor = UIColor.gray
            chooseColorR = 153/255
            chooseColorG = 153/255
            chooseColorB = 153/255
            print(sender.tag)
            break
        default:
            chooseColorR = 247/255
            chooseColorG = 147/255
            chooseColorB = 30/255
            print("done")
            break
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
