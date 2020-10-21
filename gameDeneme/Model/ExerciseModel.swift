//
//  ExerciseModel.swift
//  gameDeneme
//
//  Created by Muhammet Taha Genç on 7.03.2020.
//  Copyright © 2020 Muhammet Taha Genç. All rights reserved.
//

import Foundation
import Firebase

struct Exercise {
    var explanation: [String]
    var id: String
    var name: String
    var dictionary: [String: Any] {
      return [
        "explanation": explanation,
        "id": id,
        "name": name,
      ]
    }
}

extension Exercise {

  init?(dictionary: [String : Any]) {
    guard let explanation = dictionary["explanation"] as? [String],
        let id = dictionary["id"] as? String,
        let name = dictionary["name"] as? String
        else { return nil }

    self.init(explanation: explanation, id: id, name: name)
  }
}
