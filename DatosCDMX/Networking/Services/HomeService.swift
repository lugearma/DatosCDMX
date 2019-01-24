//
//  HomeService.swift
//  DatosCDMX
//
//  Created by Luis Arias on 1/23/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import Foundation

protocol HomeServiceProtocol: class {
  func allCategories(_ completion: @escaping (Category) -> Void)
  func lastModifications(_ completion: @escaping (Any) -> Void)
  func mostPopular(_ completion: @escaping (Any) -> Void)
}

final class HomeService: HomeServiceProtocol {
  
  let api = APIClient()
  
  func allCategories(_ completion: @escaping (Category) -> Void) {
    api.getCategories { result in
      switch result {
      case .failure(let error):
        fatalError(error.localizedDescription)
      case .success(let value):
        completion(value)
      }
    }
  }

  func lastModifications(_ completion: @escaping (Any) -> Void) {
    
  }
  
  func mostPopular(_ completion: @escaping (Any) -> Void) {
    
  }
}
