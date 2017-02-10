
import UIKit
@IBDesignable
class LittleCircle: UIButton {
    @IBInspectable var fillColor: UIColor = UIColor.green
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
    }
    
    
}
