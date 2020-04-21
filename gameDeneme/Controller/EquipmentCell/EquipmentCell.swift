//
//  EquipmentCell.swift
//  gameDeneme
//
//  Created by Muhammet Taha Genç on 16.04.2020.
//  Copyright © 2020 Muhammet Taha Genç. All rights reserved.
//

import UIKit

class EquipmentCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var leftImage: UIImageView!
    
    @IBOutlet weak var exerciseName: UILabel!
    
    @IBOutlet weak var rightImage: UIImageView!
}
