

import UIKit

class NewPage2ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var images:[UIImage] = [UIImage(named:"picMeeting.png")!,UIImage(named:"picReading.png")!,UIImage(named:"picClimbing.png")!,UIImage(named:"picDating.png")!,UIImage(named:"picUpload.png")!]
    @IBOutlet weak var imageCollectionView: UICollectionView!
    var schedule:MyProjectMO!
    var scheduleName:String = ""
    var scheduleDate:String = ""
    var scheduleImage:UIImage? = nil
    @IBOutlet weak var descriptTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular {
            return CGSize(width: 80, height: 80)
        }else{
            return CGSize(width: 128, height: 128)
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imageCollectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCollectionViewCell
        cell.image.image = images[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.layer.borderWidth = 2.0
        print(indexPath.row)
        if (indexPath.row == images.count - 1){
            choosePhoto()
        }
    }
    @IBAction func doneClick(_ sender: UIButton) {
        saveData(name: scheduleName,date: scheduleDate,color: scheduleDate )
    }
    func saveData(name:String,date:String,color:String){
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            schedule = MyProjectMO(context: appDelegate.persistentContainer.viewContext)
            schedule.name = scheduleName
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            schedule.date = dateFormatter.date(from: scheduleDate) as NSDate?
            if let imageData = UIImagePNGRepresentation(scheduleImage!){
                schedule.image = NSData(data: imageData)
            }
            schedule.descript = descriptTextView.text
            appDelegate.saveContext()
        }
        
    }
    func choosePhoto(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            present(imagePicker, animated: true, completion: nil)
        }
    }
    func useCamera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .camera
            present(imagePicker, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            images.insert(selectedImage, at: images.count-1)
        }
        dismiss(animated: true, completion: nil)
        imageCollectionView.reloadData()
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
