//
//  Facet.swift
//  DatosCDMXTests
//
//  Created by Luis Arias on 1/24/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import Foundation

struct FacetGroup: Codable {
  let name: String?
  let facets: [Facet]?
}

#warning("Change String to enum")
struct Facet: Codable {
  let name: String?
  let path: String?
  let count: Int?
  let state: String?
}
