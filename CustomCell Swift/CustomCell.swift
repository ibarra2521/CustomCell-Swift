//
//  CustomCell.swift
//  CustomCell Swift
//
//  Created by Nivardo Ibarra on 10/28/15.
//  Copyright © 2015 Nivardo Ibarra. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var lblLeft: UILabel!
    @IBOutlet weak var lblRight: UILabel!
    @IBOutlet weak var imageViewMain: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell(lblLeftText: String, lblRightInt: String, imageName: String) {
        self.lblLeft.text = lblLeftText
        self.lblRight.text = lblRightInt
        self.imageViewMain.image = UIImage(named: imageName)
    }
}
