
import UIKit

class FolderController: TitleViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var folderImageCollectionView: UICollectionView!
    var images:[UIImage] = [UIImage(named:"picMeeting.png")!,UIImage(named:"picReading.png")!,UIImage(named:"picClimbing.png")!,UIImage(named:"picDating.png")!,UIImage(named:"picUpload.png")!]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular {
            return CGSize(width: 180, height: 180)
        }else{
            return CGSize(width: 256, height: 256)
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = folderImageCollectionView.dequeueReusableCell(withReuseIdentifier: "folderImageCell", for: indexPath) as! FolderImageCollectionViewCell
        cell.imageCell.image = images[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.layer.borderWidth = 2.0
        print(indexPath.row)
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
