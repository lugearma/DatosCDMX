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
  func didReceiveCategory()
}

class ItemsListViewModel {
  
  weak var delegate: ItemsListViewModelDelegate?
  var menuService = MenuService()
  
  func getCategory() {
    menuService.getCategory { result in
      switch result {
      case .failure(let error):
        self.delegate?.didThrowError(error)
      case .success(let value):
        print("🥵🥵🥵🥵: ", value.datasets.first?.metas?.title)
        self.delegate?.didReceiveCategory()
      }
    }
  }
}
