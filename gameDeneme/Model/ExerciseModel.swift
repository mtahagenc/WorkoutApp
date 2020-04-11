//
//  ExerciseModel.swift
//  gameDeneme
//
//  Created by Muhammet Taha Genç on 7.03.2020.
//  Copyright © 2020 Muhammet Taha Genç. All rights reserved.
//

import Foundation
import Firebase

struct Hebele {

  var name: String
  var surname: String
  var dictionary: [String: Any] {
    return [
      "name": name,
      "surname": surname,
    ]
  }
}

extension Hebele {

  init?(dictionary: [String : Any]) {
    guard let name = dictionary["name"] as? String,
        let surname = dictionary["surname"] as? String else { return nil }

    self.init(name:name, surname:surname)
  }

}
