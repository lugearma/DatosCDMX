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
  func didReceiveCategories(_ categories: Category) {
    print(categories)
  }
}
