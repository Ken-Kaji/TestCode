//
//  DrawerCell.swift
//  DrawerMenuPresentationControllerSample
//
//  Created by 塚田誠司 on 2020/12/02.
//  Copyright © 2020 Classmethod. All rights reserved.
//

import UIKit

class DrawerCell: UITableViewCell {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
