//
//  TimelineCell.swift
//  Succeed
//
//  Created by Paul Wen on 2017/3/6.
//  Copyright © 2017年 Paul Wen. All rights reserved.
//

import UIKit

class TimelineCell: UITableViewCell {

    @IBOutlet weak var timelineName: UILabel!

    @IBOutlet weak var timelineTime: UILabel!
    
    @IBOutlet weak var timelineBackImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
