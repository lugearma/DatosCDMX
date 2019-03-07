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
  func getCategory(by name: String, _ completion: @escaping (Result<Category>) -> Void)
}

final class MenuService: MenuServiceProtocol {
  
  let api: ApiClientProtocol
  
  init(api: ApiClientProtocol) {
    self.api = api
  }
  
  func allCategories(_ completion: @escaping (Result<Category>) -> Void) {
    api.getCategories(completion)
  }
  
  func getCategory(by name: String, _ completion: @escaping (Result<Category>) -> Void) {
    api.getCategory(named: name, completion)
  }
}
