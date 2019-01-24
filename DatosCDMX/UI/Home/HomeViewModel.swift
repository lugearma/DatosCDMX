//
//  HomeViewModel.swift
//  DatosCDMX
//
//  Created by Luis Arias on 1/23/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import Foundation

protocol HomeViewModelDelegate: class {
  func didReceiveCategories(_ categories: Category)
}

final class HomeViewModel {
  
  var homeService = HomeService()
  weak var delegate: HomeViewModelDelegate?
  
  func requestCategories() {
    homeService.allCategories { category in
      self.delegate?.didReceiveCategories(category)
    }
  }
}
