//
//  CategoriesViewModel.swift
//  DatosCDMX
//
//  Created by Luis Arias on 1/24/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import Foundation

protocol CategoriesViewModelDelegate: class, ErrorThrowable {
  func didReceiveCategories(_ categories: [Facet])
}

final class CategoriesViewModel {
  
  let homeService = HomeService()
  weak var delegate: CategoriesViewModelDelegate?
  
  func requestCategories() {
    homeService.allCategories { result in
      switch result {
      case .failure(let error):
        self.delegate?.didThrowError(error: error)
      case .success(let categories):
        let facets = categories.facetGroup.first?.facets ?? []
        self.delegate?.didReceiveCategories(facets)
      }
      
    }
  }
}
