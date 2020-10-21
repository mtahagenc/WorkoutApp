//
//  BooksModel.swift
//  Workout Guide
//
//  Created by Muhammet Taha Genç on 3.05.2020.
//  Copyright © 2020 Muhammet Taha Genç. All rights reserved.
//

import Foundation
import Firebase

struct Book {
    var name: String
    var auther: String
    var url: String
    var photoUrl: String
    var dictionary: [String: Any] {
      return [
        "name": name,
        "auther": auther,
        "url": url,
        "photoUrl": photoUrl,
      ]
    }
}

extension Book {
  init?(dictionary: [String : Any]) {
    guard let name = dictionary["name"] as? String,
        let auther = dictionary["auther"] as? String,
        let url = dictionary["url"] as? String,
        let photoUrl = dictionary["photoUrl"] as? String
        else { return nil }

    self.init(name: name, auther: auther, url: url, photoUrl: photoUrl)
  }
}

