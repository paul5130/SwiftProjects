
import UIKit
import CoreData

class DetailProjectController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var images:[UIImage] = [UIImage(named:"picMeeting.png")!,UIImage(named:"picReading.png")!,UIImage(named:"picClimbing.png")!,UIImage(named:"picDating.png")!,UIImage(named:"picUpload.png")!]
    @IBOutlet weak var detailImageCollection: UICollectionView!
    
    @IBOutlet weak var descrtipt: UITextView!
    
    var projectMO:MyProjectMO!
    var projectColorR = 0
    var projectColorG = 0
    var projectColorB = 0
    var projectDate = Date()
    var projectName = ""
    var projectImage = UIImage(named: "picDictionary.png")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = detailImageCollection.dequeueReusableCell(withReuseIdentifier: "detailImageCell", for: indexPath) as! ImageCollectionViewCell
        cell.image.image = images[indexPath.row]
        return cell
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
    
    @IBAction func saveProject(_ sender: Any) {
        if descrtipt.text == "" {
            let alertController = UIAlertController(title: "Oops", message: "Must input descript", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }else{
            if let appDelegate = (UIApplication.shared.delegate as?AppDelegate){
                projectMO = MyProjectMO(context: appDelegate.persistentContainer.viewContext)
                projectMO.date = projectDate as NSDate
                projectMO.descript = descrtipt.text
                projectMO.name = projectName
                projectMO.colorR = Float(projectColorR)
                projectMO.colorG = Float(projectColorG)
                projectMO.colorB = Float(projectColorB)
                if let myImage = projectImage{
                    if let imageData = UIImageJPEGRepresentation(myImage, 80){
                    //if let imageData = UIImagePNGRepresentation(myImage){
                        projectMO.image = NSData(data: imageData)
                    }
                }
                print("Saving data to context...")
                appDelegate.saveContext()
                self.navigationController?.popToRootViewController(animated: true)
            }
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
        detailImageCollection.reloadData()
    }

}
