//
//  CategoriesViewModel.swift
//  DatosCDMX
//
//  Created by Luis Arias on 1/24/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import Foundation

protocol CategoriesViewModelDelegate: class {
  func didReceiveCategories(_ categories: [Facet])
}

final class CategoriesViewModel {
  
  let homeService = HomeService()
  weak var delegate: CategoriesViewModelDelegate?
  
  func requestCategories() {
    homeService.allCategories { categories in
      let facets = categories.facetGroup.first?.facets ?? []
      self.delegate?.didReceiveCategories(facets)
    }
  }
}
