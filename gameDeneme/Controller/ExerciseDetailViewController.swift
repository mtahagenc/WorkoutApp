//
//  ExerciseDetailViewController.swift
//  gameDeneme
//
//  Created by Muhammet Taha Genç on 6.03.2020.
//  Copyright © 2020 Muhammet Taha Genç. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView

protocol ExerciseProtocol {
    func getExercise() -> Exercise
}

class ExerciseDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var delegate:ExerciseProtocol?
    
    @IBOutlet weak var exerciseName: UINavigationItem!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var videoView: WKYTPlayerView!
        
    @IBAction func backToExercisesBtn(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        videoView.load(withVideoId: delegate!.getExercise().id)
        exerciseName.title = delegate!.getExercise().name
        addSwipe()
        setupTableView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate!.getExercise().explanation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseDetail", for: indexPath) as! ExplanationTableViewCell
        
        cell.explanationLabel.text = delegate!.getExercise().explanation[indexPath.row]
        
        return cell
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
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        tableView.separatorStyle = .none
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
