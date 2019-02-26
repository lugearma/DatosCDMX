//
//  HomeViewModel.swift
//  DatosCDMX
//
//  Created by Luis Arias on 1/23/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import Foundation

protocol ErrorThrowable {
  func didThrowError(error: Error)
}

protocol HomeViewModelDelegate: class, ErrorThrowable {
  func didReceiveCategories(_ categories: Category)
  func didThrowError(error: Error)
}

final class HomeViewModel {
  
  var homeService = HomeService()
  weak var delegate: HomeViewModelDelegate?
  
  func requestCategories() {
    homeService.allCategories { result in
      switch result {
      case .failure(let error):
        self.delegate?.didThrowError(error: error)
      case .success(let category):
        self.delegate?.didReceiveCategories(category)
      }
      
    }
  }
}
