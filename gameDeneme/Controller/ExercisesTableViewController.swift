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

class ExercisesTableViewController: UITableViewController {
    
    //MARK: - Variables and Constants    
    let exercisesArray = ["tPY6QbsXheg","3ml7BH7mNwQ","zvId5KzQGwk","odhXwoS3mDA","bTGPfJUJRh0","6Z15_WdXmVw","VwIomrNRCTI","NlcTeNA61tU"]
    let baseImageURL = "http://img.youtube.com/vi/"
    let jpgString = "/0.jpg"
    let db = Firestore.firestore()
    private var hebeles: [Hebele] = []
    private var documents: [DocumentSnapshot] = []
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        registerTableViewCells()
        getData()
    }
    
    
    //MARK: - TableView Functions
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercisesArray.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.width / 1.77
    }
    
    func registerTableViewCells () {
        //We are registering the cell we created to the tableview
        let anyTableViewCell = UINib(nibName: "ExerciseCell", bundle: nil)
        self.tableView.register(anyTableViewCell, forCellReuseIdentifier: "ExerciseCell")
     }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath) as! ExerciseCell
        let urlString = "\(baseImageURL)\(exercisesArray[indexPath.row])\(jpgString)"
        cell.thumbnailImage.setImageWithKF(urlString)
        cell.thumbnailImage.contentMode = .scaleAspectFill
        
        return cell
    }
    
    func saveData () {
        let citiesRef = db.collection("Exercises")
        citiesRef.document("Dumbell").setData(["exercises":"asdasda"])
    }
    
    func getData() {
        db.collection("Deneme").getDocuments() { (snapshot, error) in
            
            guard let snapshot = snapshot else {
              print("Error fetching snapshot results: \(error!)")
              return
            }
            
            let models = snapshot.documents.map { (document) -> Hebele in
            if let model = Hebele(dictionary: document.data()) {
                print(model.name)
                print(model.surname)
                return model
            } else {
                // Don't use fatalError here in a real app.
                fatalError("Unable to initialize type \(Hebele.self) with dictionary \(document.data())")
                }
            }
        }
    }
}
