
import UIKit
@IBDesignable
open class ImageViewWithGradient: UIImageView {
//    @IBInspectable var gradientColor: CGColor = UIColor(red: 0.95, green: 0.35, blue: 0.14, alpha: 1).cgColor

    open var initialColor: UIColor = UIColor(red: 241/255, green: 90/255, blue: 36/255, alpha: 1)
    let myGradientLayer = CAGradientLayer()

    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.setup(gradientColor: initialColor)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup(gradientColor: initialColor)
//        fatalError("init(coder:) has not been implemented")
    }
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        self.setup(gradientColor: initialColor)
    }
    
    open func setup(gradientColor:UIColor)
    {
        myGradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        myGradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
        let gradientColor2 = gradientColor.withAlphaComponent(0)
        let colors: [CGColor] = [
//            UIColor.clear.cgColor,
            gradientColor.cgColor,
            gradientColor2.cgColor]
//            UIColor.clear.cgColor ]
        myGradientLayer.colors = colors
        myGradientLayer.isOpaque = false
        myGradientLayer.locations = [0.0, 1.0]
        self.layer.addSublayer(myGradientLayer)
    }
    
    override open func layoutSubviews()
    {
        myGradientLayer.frame = self.layer.bounds
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
