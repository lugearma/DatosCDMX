//
//  ItemsListViewModel.swift
//  DatosCDMX
//
//  Created by Luis Arias on 2/27/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import Foundation

protocol ItemsListViewModelDelegate: class {
  func didThrowError(_ error: Error)
  func didReceiveItems(_ items: [Dataset])
}

class ItemsListViewModel {
  
  weak var delegate: ItemsListViewModelDelegate?
  private let menuService: MenuServiceProtocol
  
  init(menuService: MenuServiceProtocol) {
    self.menuService = menuService
  }
  
  func getCategory() {
    menuService.getCategory { [weak self] result in
      DispatchQueue.main.async {
        switch result {
        case .failure(let error):
          self?.delegate?.didThrowError(error)
        case .success(let value):
          self?.delegate?.didReceiveItems(value.datasets)
        }
      }
      
    }
  }
}
