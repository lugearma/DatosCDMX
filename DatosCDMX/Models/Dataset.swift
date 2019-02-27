//
//  Dataset.swift
//  DatosCDMX
//
//  Created by Luis Arias on 2/26/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import Foundation

struct Dataset: Decodable {
  let datasetid: String?
  let metas: Metas?
}

struct Metas {
  let publisher: String?
  let description: String?
  let title: String?
  let theme: String
  
  enum CodingKeys: String, CodingKey {
    case publisher
    case description
    case title
    case theme
  }
}

extension Metas: Decodable {
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    publisher = try values.decode(String.self, forKey: .publisher)
    description = try values.decode(String.self, forKey: .description)
    title = try values.decode(String.self, forKey: .title)
    theme = try values.decode(String.self, forKey: .theme)
  }
}
