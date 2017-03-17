
import UIKit
import UserNotifications
class NewPage1ViewController: UIViewController {
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var txtProjectName: UITextField!
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var whiteButton: LittleCircle!
    
    @IBOutlet weak var orangeButton: LittleCircle!
    
    @IBOutlet weak var pinkButton: LittleCircle!
    
    @IBOutlet weak var greenButton: LittleCircle!
    
    @IBOutlet weak var lightBlue: LittleCircle!
    
    @IBOutlet weak var navyBlue: LittleCircle!
    
    @IBOutlet weak var grayButton: LittleCircle!
    
    
    var dateString:String = ""
    
    var colorDictionary:[String:LittleCircle] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        datePicker.datePickerMode = .dateAndTime
        datePicker.minuteInterval = 15
        datePicker.locale = NSLocale(localeIdentifier: "zh_TW") as Locale
        
        datePicker.addTarget(self, action: #selector(NewPage1ViewController.datePickerValueChange(sender:)), for: .valueChanged)
        colorDictionary = ["white": whiteButton,"orange":orangeButton,"pink":pinkButton,"green":greenButton,"lightBlue":lightBlue,"navyBlue":navyBlue,"gray":grayButton]
        colorDictionary["white"]?.backgroundColor = UIColor.gray
        prepareNotification()
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
    func datePickerValueChange(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateString = dateFormatter.string(from: sender.date)
        print("date select: \(dateString)")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goPage2"{
            let destinationConroller = segue.destination as! NewPage2ViewController
            destinationConroller.scheduleName = txtProjectName.text!
            destinationConroller.scheduleDate = dateString
        }
    }
    func prepareNotification(){
        let content = UNMutableNotificationContent()
        content.title = "It's time for plan"
        content.subtitle = "ready to go?"
        content.sound = UNNotificationSound.default()
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        let request = UNNotificationRequest(identifier: "Succeed.notification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    @IBAction func buttonPresset(sender: UIButton)
    {
        for colorButton in colorDictionary.values{
            colorButton.backgroundColor = UIColor.clear
        }
        switch sender.tag {
        case 0:
            colorDictionary["white"]?.backgroundColor = UIColor.gray
            print("white")
            break
        case 1 :
            colorDictionary["orange"]?.backgroundColor = UIColor.gray
            print("orange")
            break
        case 2 :
            colorDictionary["pink"]?.backgroundColor = UIColor.gray
            print("pink")
            break
        case 3 :
            colorDictionary["green"]?.backgroundColor = UIColor.gray
            print("green")
            break
        case 4 :
            colorDictionary["lightBlue"]?.backgroundColor = UIColor.gray
            print("lightblue")
            break
        case 5 :
            colorDictionary["navyBlue"]?.backgroundColor = UIColor.gray
            print("navyblue")
            break
        case 6 :
            colorDictionary["gray"]?.backgroundColor = UIColor.gray
            print("gray")
            break
        default:
            print("none")
            break
        }
    }

}

