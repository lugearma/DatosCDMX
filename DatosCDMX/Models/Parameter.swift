//
//  Parameter.swift
//  DatosCDMX
//
//  Created by Luis Arias on 1/24/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import Foundation

struct Parameter: Codable {
  let timezone: String?
  let rows: Int?
  let format: String?
  let staged: Bool?
  let facet: [String]?
}
