//
//  ExerciseCell.swift
//  gameDeneme
//
//  Created by Muhammet Taha Genç on 19.02.2020.
//  Copyright © 2020 Muhammet Taha Genç. All rights reserved.
//

import UIKit

class ExerciseCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailImage.layer.cornerRadius = 8
        exerciseName.layer.masksToBounds = true
        exerciseName.layer.cornerRadius = 8
        exerciseName.backgroundColor = UIColor.white.withAlphaComponent(0.6)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var exerciseName: UILabel!
    @IBOutlet weak var thumbnailImage: UIImageView!
}
