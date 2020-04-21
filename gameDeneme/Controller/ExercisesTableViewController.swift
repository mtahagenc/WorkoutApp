//
//  ExercisesTableVİewController.swift
//  gameDeneme
//
//  Created by Muhammet Taha Genç on 18.02.2020.
//  Copyright © 2020 Muhammet Taha Genç. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView
import Kingfisher
import Firebase

protocol EquipmentProtocol {
    func getEquipment() -> String
}

class ExercisesTableViewController: UITableViewController, ExerciseProtocol{
    
    var exerciseToSend: Exercise? {
        didSet{
            performSegue(withIdentifier: "showDetail", sender: self)
        }
    }
    
    func getExercise() -> Exercise {
        return exerciseToSend!
    }
    
    
    //MARK: - Variables and Constants
    var delegate:EquipmentProtocol?
    let exercisesArray = ["tPY6QbsXheg","3ml7BH7mNwQ","zvId5KzQGwk","odhXwoS3mDA","bTGPfJUJRh0","6Z15_WdXmVw","VwIomrNRCTI","NlcTeNA61tU"]
    let baseImageURL = "http://img.youtube.com/vi/"
    let jpgString = "/0.jpg"
    let db = Firestore.firestore()
    private var exercises: [Exercise] = []
    private var documents: [DocumentSnapshot] = []
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        registerTableViewCells()
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        getData(exerciseName: self.delegate!.getEquipment())
        addSwipe()
    }
    
    
    //MARK: - TableView Functions
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.width / 2.77
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath) as! ExerciseCell
        cell.exerciseName.text = exercises[indexPath.row].name
        let urlString = "\(baseImageURL)\(exercises[indexPath.row].id)\(jpgString)"
        cell.thumbnailImage.setImageWithKF(urlString)
        cell.thumbnailImage.contentMode = .scaleAspectFill
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        exerciseToSend = exercises[indexPath.row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let des = segue.destination as! ExerciseDetailViewController
        des.delegate = self
    }
    
    func registerTableViewCells () {
        //We are registering the cell we created to the tableview
        let anyTableViewCell = UINib(nibName: "ExerciseCell", bundle: nil)
        self.tableView.register(anyTableViewCell, forCellReuseIdentifier: "ExerciseCell")
     }

    //MARK: - Functions
    
    func getData(exerciseName: String) {
        db.collection(exerciseName).getDocuments() { (snapshot, error) in
            
            guard let snapshot = snapshot else {
              print("Error fetching snapshot results: \(error!)")
              return
            }
            
            let models = snapshot.documents.map { (document) -> Exercise in
            if let model = Exercise(dictionary: document.data()) {
                return model
            } else {
                // Don't use fatalError here in a real app.
                fatalError("Unable to initialize type \(Exercise.self) with dictionary \(document.data())")
                }
            }
            
            self.documents = snapshot.documents
            DispatchQueue.main.async {
                self.exercises = models
                self.tableView.reloadData()
            }
        }
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
    
    func thumWidth () -> CGFloat {
        let thumbWidth = view.frame.width * 1.77
        
        return thumbWidth
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
