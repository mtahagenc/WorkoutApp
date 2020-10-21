//
//  HomeViewController.swift
//  gameDeneme
//
//  Created by Muhammet Taha Genç on 21.04.2020.
//  Copyright © 2020 Muhammet Taha Genç. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBAction func startBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "showModel", sender: self)
    }
    @IBAction func aboutBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "showAbout", sender: self)
    }
    
    @IBOutlet weak var dividerView: UIView!
    @IBOutlet weak var startBtnOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceByMode()
    }
    
    
    
    func appearanceByMode() {
        startBtnOutlet.layer.cornerRadius = 6
        if self.traitCollection.userInterfaceStyle == .dark {
            dividerView.backgroundColor = .white
            startBtnOutlet.setTitleColor(.black, for: .normal)
        } else {
            dividerView.backgroundColor = .black
            startBtnOutlet.setTitleColor(.white, for: .normal)
        }
    }
    
    
    
}
