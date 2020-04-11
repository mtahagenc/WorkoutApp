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

    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
    }
    
    @IBOutlet weak var exerciseName: UINavigationItem!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var infoTextView: UITextView!
    
    @IBOutlet weak var videoView: WKYTPlayerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoView.load(withVideoId: "3ml7BH7mNwQ")

    }
}
