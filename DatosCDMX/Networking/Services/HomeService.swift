//
//  MenuService.swift
//  DatosCDMX
//
//  Created by Luis Arias on 1/23/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import Foundation

protocol MenuServiceProtocol: class {
  func allCategories(_ completion: @escaping (Result<Category>) -> Void)
  func getCategory(_ completion: @escaping (Result<Category>) -> Void)
}

final class MenuService: MenuServiceProtocol {
  
  let api = APIClient()
  
  func allCategories(_ completion: @escaping (Result<Category>) -> Void) {
    api.getCategories(completion)
  }
  
  func getCategory(_ completion: @escaping (Result<Category>) -> Void) {
    api.getCategory(completion)
  }
}
