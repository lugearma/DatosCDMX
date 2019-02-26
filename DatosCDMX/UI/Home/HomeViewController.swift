//
//  HomeViewController.swift
//  DatosCDMX
//
//  Created by Luis Arias on 1/16/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  let viewModel: HomeViewModel
  
  init(viewModel: HomeViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewModel.delegate = self
    viewModel.requestCategories()
  }
}

extension HomeViewController: HomeViewModelDelegate {
  func didThrowError(error: Error) {
    print("‼️ -> ", error)
  }
  
  func didReceiveCategories(_ categories: Category) {
    print(categories)
  }
}

extension HomeViewController: AlertPresentable {
  var alertComponents: AlertComponents {
    let action = AlertActionComponent(title: "Ok", handler: {_ in print("My task :)")})
    let alertComponents = AlertComponents(title: "Alert", message: "Not a simple one, is a POP one.", actions: [action], completion: {
      print("Just presented")
    })
    return alertComponents
  }
}
