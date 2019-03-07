//
//  Navigator.swift
//  DatosCDMX
//
//  Created by Luis Arias on 3/5/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import UIKit

protocol Navegable where Self: UIViewController {
  var navigator: Navigator? { get set }
}

class Navigator {
  
  enum NavigationBase {
    case navigationCotroller
    case viewController
  }
  
  enum Destination {
    case itemsList(selection: String)
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
    case .itemsList(let selection):
      destinationController = ViewControllerFactory.makeItemsListViewController(selection)
      
    case .menu:
      destinationController = ViewControllerFactory.makeMenuViewController()
    }
    
    if var controller = destinationController as? Navegable {
      controller.navigator = self
    }
    
    if let navigationController = mainViewController as? UINavigationController {
      navigationController.pushViewController(destinationController, animated: true)
    }
  }
}
