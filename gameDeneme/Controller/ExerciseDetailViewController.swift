//
//  ExerciseDetailViewController.swift
//  gameDeneme
//
//  Created by Muhammet Taha Genç on 6.03.2020.
//  Copyright © 2020 Muhammet Taha Genç. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView

class ExerciseDetailViewController: UIViewController {
    
    @IBOutlet weak var exerciseName: UINavigationItem!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var infoTextView: UITextView!
    
    @IBOutlet weak var videoView: WKYTPlayerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoView.load(withVideoId: "3ml7BH7mNwQ")
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


