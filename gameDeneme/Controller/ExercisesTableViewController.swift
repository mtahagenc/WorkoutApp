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
    func getEquipment() -> [Exercise]
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

    
    //MARK: - ViewDidLoad and ViewWillAppear
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        registerTableViewCells()
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        addSwipe()
        
    }
    
    //MARK: - TableView Functions
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.getEquipment().count ?? 0
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.width / 2.77
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath) as! ExerciseCell
        cell.exerciseName.text = delegate?.getEquipment()[indexPath.row].name
        let urlString = "\(PublicURLs().baseImageURL)\(delegate?.getEquipment()[indexPath.row].id ?? "")\(PublicURLs().jpgString)"
        cell.thumbnailImage.setImageWithKF(urlString)
        cell.thumbnailImage.contentMode = .scaleAspectFill
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        exerciseToSend = delegate?.getEquipment()[indexPath.row]
    }
    
    //MARK: - Navigation
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
    
    
    //MARK: - Functions for Admob
    
//    func createAndLoadInterstitial() -> GADInterstitial {
//        let interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
//
//        interstitial.delegate = self
//        interstitial.load(GADRequest())
//
//        return interstitial
//    }
//
//    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
//      interstitial = createAndLoadInterstitial()
//    }
//
//    func showAd(){
//        let number = Int.random(in: 0 ... 10)
//        if number % 5 == 0 {
//            if self.interstitial.isReady {
//              self.interstitial.present(fromRootViewController: self)
//
//            } else {
//                print("Ad wasn't ready")
//            }
//        }
//    }
}
