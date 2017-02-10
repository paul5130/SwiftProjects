
import UIKit

class NewPage1ViewController: UIViewController {
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var txtProjectName: UITextField!
    
    @IBOutlet weak var colorView: UIView!
    
    var dateString:String = ""
    
    var colorDictionary:[String:Bool] = ["white":true,"orange":false,"pink":false,"green":false,"lightBlue":false,"navyBlue":false,"gray":false]
    
    
    @IBOutlet weak var whiteCircle: LittleCircle!
    @IBAction func whiteCircleClick(_ sender: UIButton) {
        orangeCircle.backgroundColor = UIColor.clear
        whiteCircle.backgroundColor = UIColor.darkGray
        pinkCircle.backgroundColor = UIColor.clear
        greenCircle.backgroundColor = UIColor.clear
        lightBlueCircle.backgroundColor = UIColor.clear
        navyBlueCircle.backgroundColor = UIColor.clear
        grayCircle.backgroundColor = UIColor.clear
        colorDictionary["white"] = true
        colorDictionary["orange"] = false
        colorDictionary["pink"] = false
        colorDictionary["green"] = false
        colorDictionary["lightBlue"] = false
        colorDictionary["navyBlue"] = false
        colorDictionary["gray"] = false
    }
    
    @IBOutlet weak var orangeCircle: LittleCircle!
    @IBAction func orangeCircleClick(_ sender: UIButton) {
        orangeCircle.backgroundColor = UIColor.darkGray
        whiteCircle.backgroundColor = UIColor.clear
        pinkCircle.backgroundColor = UIColor.clear
        greenCircle.backgroundColor = UIColor.clear
        lightBlueCircle.backgroundColor = UIColor.clear
        navyBlueCircle.backgroundColor = UIColor.clear
        grayCircle.backgroundColor = UIColor.clear
        colorDictionary["white"] = false
        colorDictionary["orange"] = true
        colorDictionary["pink"] = false
        colorDictionary["green"] = false
        colorDictionary["lightBlue"] = false
        colorDictionary["navyBlue"] = false
        colorDictionary["gray"] = false
    }
    
    @IBOutlet weak var pinkCircle: LittleCircle!
    @IBAction func pinkCircleClick(_ sender: UIButton) {
        orangeCircle.backgroundColor = UIColor.clear
        whiteCircle.backgroundColor = UIColor.clear
        pinkCircle.backgroundColor = UIColor.darkGray
        greenCircle.backgroundColor = UIColor.clear
        lightBlueCircle.backgroundColor = UIColor.clear
        navyBlueCircle.backgroundColor = UIColor.clear
        grayCircle.backgroundColor = UIColor.clear
        colorDictionary["white"] = false
        colorDictionary["orange"] = false
        colorDictionary["pink"] = true
        colorDictionary["green"] = false
        colorDictionary["lightBlue"] = false
        colorDictionary["navyBlue"] = false
        colorDictionary["gray"] = false
    }
    
    @IBOutlet weak var greenCircle: LittleCircle!
    @IBAction func greenCircleClick(_ sender: UIButton) {
        orangeCircle.backgroundColor = UIColor.clear
        whiteCircle.backgroundColor = UIColor.clear
        pinkCircle.backgroundColor = UIColor.clear
        greenCircle.backgroundColor = UIColor.darkGray
        lightBlueCircle.backgroundColor = UIColor.clear
        navyBlueCircle.backgroundColor = UIColor.clear
        grayCircle.backgroundColor = UIColor.clear
        colorDictionary["white"] = false
        colorDictionary["orange"] = false
        colorDictionary["pink"] = false
        colorDictionary["green"] = true
        colorDictionary["lightBlue"] = false
        colorDictionary["navyBlue"] = false
        colorDictionary["gray"] = false
    }
    
    @IBOutlet weak var lightBlueCircle: LittleCircle!
    @IBAction func lightBlueCircleClick(_ sender: UIButton) {
        orangeCircle.backgroundColor = UIColor.clear
        whiteCircle.backgroundColor = UIColor.clear
        pinkCircle.backgroundColor = UIColor.clear
        greenCircle.backgroundColor = UIColor.clear
        lightBlueCircle.backgroundColor = UIColor.darkGray
        navyBlueCircle.backgroundColor = UIColor.clear
        grayCircle.backgroundColor = UIColor.clear
        colorDictionary["white"] = false
        colorDictionary["orange"] = false
        colorDictionary["pink"] = false
        colorDictionary["green"] = false
        colorDictionary["lightBlue"] = true
        colorDictionary["navyBlue"] = false
        colorDictionary["gray"] = false
    }
    
    @IBOutlet weak var navyBlueCircle: LittleCircle!
    @IBAction func navyBlueCircleClick(_ sender: UIButton) {
        orangeCircle.backgroundColor = UIColor.clear
        whiteCircle.backgroundColor = UIColor.clear
        pinkCircle.backgroundColor = UIColor.clear
        greenCircle.backgroundColor = UIColor.clear
        lightBlueCircle.backgroundColor = UIColor.clear
        navyBlueCircle.backgroundColor = UIColor.darkGray
        grayCircle.backgroundColor = UIColor.clear
        colorDictionary["white"] = false
        colorDictionary["orange"] = false
        colorDictionary["pink"] = false
        colorDictionary["green"] = false
        colorDictionary["lightBlue"] = false
        colorDictionary["navyBlue"] = true
        colorDictionary["gray"] = false
    }
    
    @IBOutlet weak var grayCircle: LittleCircle!
    
    @IBAction func grayCircleClick(_ sender: UIButton) {
        orangeCircle.backgroundColor = UIColor.clear
        whiteCircle.backgroundColor = UIColor.clear
        pinkCircle.backgroundColor = UIColor.clear
        greenCircle.backgroundColor = UIColor.clear
        lightBlueCircle.backgroundColor = UIColor.clear
        navyBlueCircle.backgroundColor = UIColor.clear
        grayCircle.backgroundColor = UIColor.darkGray
        colorDictionary["white"] = false
        colorDictionary["orange"] = false
        colorDictionary["pink"] = false
        colorDictionary["green"] = false
        colorDictionary["lightBlue"] = false
        colorDictionary["navyBlue"] = false
        colorDictionary["gray"] = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        datePicker.datePickerMode = .dateAndTime
        datePicker.minuteInterval = 15
        datePicker.locale = NSLocale(localeIdentifier: "zh_TW") as Locale
        whiteCircle.backgroundColor = UIColor.darkGray
        datePicker.addTarget(self, action: #selector(NewPage1ViewController.datePickerValueChange(sender:)), for: .valueChanged)
    }
    override func viewDidAppear(_ animated: Bool) {
        if let pageViewController = storyboard?.instantiateViewController(withIdentifier: "WalkthroughController") as? WalkthroughPageViewController{
            present(pageViewController, animated: true, completion: nil)
        }
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

    @IBAction func buttonPresset(sender: UIButton)
    {
        switch sender.tag {
        case 0:

            print("0")
            break;
        case 1 :

            print("0")
            break;
        default:
            break;
        }
    }

}

