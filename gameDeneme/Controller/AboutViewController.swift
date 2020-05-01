//
//  AboutViewController.swift
//  gameDeneme
//
//  Created by Muhammet Taha Genç on 21.04.2020.
//  Copyright © 2020 Muhammet Taha Genç. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var aboutTextVieq: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutTextVieq.text = " \n \nWorkout Guid v1.0 \n \n \n \nWorkout Guide her şeyin karmaşıklaştığı ve doğru bilgiye ulaşmanın gittikçe zorlaştığı günümüz dünyasında en azından fitness alanında doğru bilgiye ulaşmayı kolaylaştırmayı amaçlamıştır. \n \nEgzersiz yaparken geliştirilmek istenen kas gruplarını çalıştırmaya yarayan en uygun egzersiz hareketlerini hiç zorlanmadan bulabileceğiniz bu uygulamada egzersizlerin videolarıyla birlikte yararlı ipıçlarını da bulabileceksiniz. \n \nHayatı sizler için kolaylaştırmaya devam edeceğimize dair söz verir, bizi seçtiğiniz için teşekkür ederiz. \n \nWorkout Guide ekibi "
        addSwipe()
    }
    
    func addSwipe() {
        //We are creating a swipe gesture to control our view without buttons
        let directions: [UISwipeGestureRecognizer.Direction] = [.right, .left, .up, .down]
        for direction in directions {
            let gesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
            gesture.direction = direction
            self.view.addGestureRecognizer(gesture)
        }
    }
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        //We are now adding functionalities to our swipe gesture
        let direction = sender.direction
        if direction == .right {
            dismiss(animated: true, completion: nil)
        } else if direction == .left {

        } else if direction == .up {
            
        } else if direction == .down {
            
        }
    }
}

