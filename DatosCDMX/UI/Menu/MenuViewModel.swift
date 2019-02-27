//
//  MenuViewModel.swift
//  DatosCDMX
//
//  Created by Luis Arias on 2/27/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import Foundation
import UIKit.UIImage

protocol MenuViewModelDelegate: class {
  func didReceiveMenuItems(_ menuItems: [MenuItem])
  func didThrow(_ error: Error)
}

class MenuViewModel {
  
  weak var delegate: MenuViewModelDelegate?
  var menuService = MenuService()
  
  func getCategories() {
    menuService.allCategories { result in
      DispatchQueue.main.async {
        switch result {
        case .failure(let error):
          self.delegate?.didThrow(error)
        case .success(let value):
          var menuItems: [MenuItem] = []
          var index = 0
          for facet in value.facetGroup?.first?.facets ?? [] {
            let item = MenuItem(description: facet.name ?? "", index: index)
            menuItems.append(item)
            index += 1
          }
          
          self.delegate?.didReceiveMenuItems(menuItems)
        }
      }
    }
  }
}
