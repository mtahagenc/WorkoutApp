//
//  EquipmentTableViewController.swift
//  gameDeneme
//
//  Created by Muhammet Taha Genç on 11.04.2020.
//  Copyright © 2020 Muhammet Taha Genç. All rights reserved.
//

import UIKit

class EquipmentTableViewController: UITableViewController {

    let equipmentArray = ["Barbell","Dumbbell","Gym","Pilates","Pull-up Bar"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }

    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        (view.frame.height - 44)/5
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
}
