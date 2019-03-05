//
//  Navigator.swift
//  DatosCDMX
//
//  Created by Luis Arias on 3/5/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import UIKit

class Navigator {
  
  enum NavigationBase {
    case navigationCotroller
    case viewController
  }
  
  enum Destination {
    case itemsList
    case menu
  }
  
  private let navigationBase: NavigationBase
  
  private lazy var mainViewController: UIViewController = {
    switch navigationBase {
    case .navigationCotroller:
      return UINavigationController()
    case .viewController:
      return UIViewController()
    }
  }()
  
  init(navigationBase: NavigationBase, window: UIWindow?) {
    self.navigationBase = navigationBase
    window?.rootViewController = mainViewController
    window?.makeKeyAndVisible()
  }
  
  func navigateTo(destination: Destination) {
    
    let destinationController: UIViewController
    
    switch destination {
    case .itemsList:
      destinationController = ViewControllerFactory.makeItemsListViewController()
    case .menu:
      destinationController = ViewControllerFactory.makeMenuViewController()
    }
    
    if let navigationController = mainViewController as? UINavigationController {
      navigationController.pushViewController(destinationController, animated: true)
    }
  }
}
