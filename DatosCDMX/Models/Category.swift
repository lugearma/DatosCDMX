//
//  Category.swift
//  DatosCDMX
//
//  Created by Luis Arias on 1/24/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import Foundation

struct Category: Decodable {
  let hints: Int
  let parameters: Parameter
  let facetGroup: [FacetGroup]?
  let datasets: [Dataset]
  
  enum CodingKeys: String, CodingKey {
    case hints = "nhits"
    case parameters
    case facetGroup = "facet_groups"
    case datasets
  }
}
