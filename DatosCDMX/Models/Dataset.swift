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

struct Metas: Decodable {
  let publisher: String?
  let description: String?
  let title: String?
  let keyword: [String]?
}
