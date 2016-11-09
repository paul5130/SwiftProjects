

import UIKit

class MyCustomView: UIView {
    // MARK: Properties
    var ratings = 0
    var ratingButtons = [UIButton]()
    let spacing = 5
    let starCount = 5
    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        for _ in 0..<starCount{
            let button = UIButton()
            button.setImage(emptyStarImage, for: .normal)
            button.setImage(filledStarImage, for: .selected)
            button.setImage(filledStarImage, for: [.highlighted,.selected])
            button.adjustsImageWhenHighlighted = false
            button.addTarget(self, action: #selector(ratingButtonTapped(button:)), for: .touchDown)
            ratingButtons += [button]
            addSubview(button)
            
        }
        
    }
    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        for (index,button) in ratingButtons.enumerated(){
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
    }
    override public var intrinsicContentSize: CGSize{
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize * starCount) + (spacing * (starCount-1))
        return CGSize(width: width, height: buttonSize)
    }
    func ratingButtonTapped(button: UIButton){
//        print("button pressed")
        ratings = ratingButtons.index(of: button)! + 1
        updateButtonSelectionStates()
    }
    func updateButtonSelectionStates(){
        for(index,button) in ratingButtons.enumerated(){
            button.isSelected = (index < ratings)
        }
    }
}
