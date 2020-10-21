//
//  BookTableViewController.swift
//  Workout Guide
//
//  Created by Muhammet Taha Genç on 2.05.2020.
//  Copyright © 2020 Muhammet Taha Genç. All rights reserved.
//

import UIKit
import Firebase
import Kingfisher

class BookTableViewController: UITableViewController{
    
    let db = Firestore.firestore()
    var books: [Book]?

    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCells()
        getData()
        addSwipe()
    }
    
    @IBAction func backToGameBtn(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as! BookCell
        cell.bookImageView.setImageWithKF(books?[indexPath.row].photoUrl ?? "")
        cell.bookNameLabel.text = books?[indexPath.row].name ?? "Nil"
        cell.autherNameLabel.text = "Yazar: \(books?[indexPath.row].auther ?? "Nil")"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: books![indexPath.row].url) else { return }
        UIApplication.shared.open(url)

    }
    
    func registerTableViewCells () {
       //We are registering the cell we created to the tableview
       let bookTableViewCell = UINib(nibName: "BookCell", bundle: nil)
       self.tableView.register(bookTableViewCell, forCellReuseIdentifier: "bookCell")
    }
    
    
    func getData() {
        db.collection("Brain").getDocuments() { (snapshot, error) in
            
            guard let snapshot = snapshot else {
              print("Error fetching snapshot results: \(error!)")
              return
            }
            
            let models = snapshot.documents.map { (document) -> Book in
            if let model = Book(dictionary: document.data()) {
                return model
            } else {
                // Don't use fatalError here in a real app.
                fatalError("Unable to initialize type \(Book.self) with dictionary \(document.data())")
                }
            }
            
            DispatchQueue.main.async {
                self.books = models
                self.tableView.reloadData()
                print(self.books?.count ?? 1)
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
