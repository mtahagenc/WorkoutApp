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

class ExercisesTableViewController: UITableViewController {
    
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
        getData()
        addSwipe()
        print(delegate!.getEquipment())
    }
    
    
    //MARK: - TableView Functions
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercisesArray.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.width / 1.77
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath) as! ExerciseCell
        let urlString = "\(baseImageURL)\(exercisesArray[indexPath.row])\(jpgString)"
        cell.thumbnailImage.setImageWithKF(urlString)
        cell.thumbnailImage.contentMode = .scaleAspectFill
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    func registerTableViewCells () {
        //We are registering the cell we created to the tableview
        let anyTableViewCell = UINib(nibName: "ExerciseCell", bundle: nil)
        self.tableView.register(anyTableViewCell, forCellReuseIdentifier: "ExerciseCell")
     }

    
    
    //MARK: - Functions
    
    func saveData () {
        let citiesRef = db.collection("Exercises")
        citiesRef.document("Dumbell").setData(["exercises":"asdasda"])
    }
    
    func getData() {
        db.collection("Exercises").getDocuments() { (snapshot, error) in
            
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
            self.exercises = models
            print(self.exercises[0].name)
            print(self.exercises[1].name)
            self.documents = snapshot.documents
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
