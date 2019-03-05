//
//  ViewControllerFactory.swift
//  DatosCDMX
//
//  Created by Luis Arias on 3/5/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import UIKit

class ViewControllerFactory {
  
  static func makeItemsListViewController() -> UIViewController {
    let itemListViewController = ItemsListViewController()
    let menuService = MenuService(api: ApiClient())
    let itemListViewModel = ItemsListViewModel(menuService: menuService)
    itemListViewController.viewModel = itemListViewModel
    return itemListViewController
  }
  
  static func makeMenuViewController() -> UIViewController {
    let menuController = MenuViewController()
    let apiClient = ApiClient()
    let menuService = MenuService(api: apiClient)
    let menuViewModel = MenuViewModel(menuService: menuService)
    menuController.viewModel = menuViewModel
    return menuController
  }
}
