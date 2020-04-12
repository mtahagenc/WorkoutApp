//
//  EquipmentTableViewController.swift
//  gameDeneme
//
//  Created by Muhammet Taha Genç on 11.04.2020.
//  Copyright © 2020 Muhammet Taha Genç. All rights reserved.
//

import UIKit

protocol BodyPartProtocol {
    func getBodyPart() -> String
}

class EquipmentTableViewController: UITableViewController,EquipmentProtocol {
    
    func getEquipment() -> String {
        //Protocol function
        return equipment!
    }
    
    var equipment: String?
    var delegate:BodyPartProtocol?
    let equipmentArray = ["Barbell","Dumbbell","Gym","Pilates","Pull-up Bar"]
    
    override func viewDidLoad() {
        print(delegate!.getBodyPart())
        super.viewDidLoad()
        addSwipe()
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        view.frame.height/5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return equipmentArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "equipment", for: indexPath)

        cell.textLabel?.text = equipmentArray[indexPath.row]
        cell.textLabel?.textAlignment = .center
        
        if indexPath.row == 0 {
            cell.backgroundColor = UIColor(red: 232, green: 232, blue: 232)
        } else if indexPath.row == 1 {
            cell.backgroundColor = UIColor(red: 174, green: 174, blue: 174)
        } else if indexPath.row == 2 {
            cell.backgroundColor = UIColor(red: 116, green: 116, blue: 116)
        } else if indexPath.row == 3 {
            cell.backgroundColor = UIColor(red: 58, green: 58, blue: 58)
            cell.textLabel?.textColor = UIColor(red: 232, green: 232, blue: 232)
        } else if indexPath.row == 4 {
            cell.backgroundColor = UIColor(red: 0, green: 0, blue: 0)
            cell.textLabel?.textColor = UIColor(red: 232, green: 232, blue: 232)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        equipment = "\(delegate!.getBodyPart())_\(equipmentArray[indexPath.row]))"
        performSegue(withIdentifier: "showExercises", sender: self)
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segu:ExercisesTableViewController = segue.destination as? ExercisesTableViewController {
            segu.delegate = self
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
