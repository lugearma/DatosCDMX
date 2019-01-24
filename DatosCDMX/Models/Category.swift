//
//  Category.swift
//  DatosCDMX
//
//  Created by Luis Arias on 1/24/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import Foundation

struct Category: Codable {
  let hints: Int
  let parameters: Parameter
  let facetGroup: [FacetGroup]
  
  enum CodingKeys: String, CodingKey {
    case hints = "nhits"
    case parameters
    case facetGroup = "facet_groups"
  }
}

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
