//
//  UIExtension.swift
//  gameDeneme
//
//  Created by Muhammet Taha Genç on 20.02.2020.
//  Copyright © 2020 Muhammet Taha Genç. All rights reserved.
//
import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    @objc func setImageWithKF(_ url : String?) {
//        self.image = UIImage()
        if let imageUrl = url {
            if let urls = URL(string : imageUrl) {
                if imageUrl != "" {
                    let resource = ImageResource(downloadURL: urls, cacheKey: imageUrl)
                    DispatchQueue.main.async {
                        self.kf.setImage(with: resource ,options:[.loadDiskFileSynchronously,.transition(ImageTransition.fade(0.5))])
                        //                    self.kf.cancelDownloadTask()
                    }
                } else {
                    self.image = UIImage()
                }
            } else {
                self.image = UIImage()
            }
        } else {
            self.image = UIImage()
        }
    }
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
