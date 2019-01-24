//
//  CategoriesViewController.swift
//  DatosCDMX
//
//  Created by Luis Arias on 1/24/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import UIKit

final class CategoriesViewController: UICollectionViewController {
  
  var categories: [Facet] = []
  let viewModel: CategoriesViewModel
  
  init(viewModel: CategoriesViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
    self.viewModel.delegate = self
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView!.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
    viewModel.requestCategories()
  }
}

// MARK: UICollectionViewDataSource

extension CategoriesViewController {
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 6
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as? CategoryCell else {
      preconditionFailure("Cannot get cell")
    }
    let category = categories[indexPath.row]
    cell.setupCellWith(category: category)
    
    return cell
  }
}

// MARK: CategoriesViewModelDelegate

extension CategoriesViewController: CategoriesViewModelDelegate {
  func didReceiveCategories(_ categories: [Facet]) {
    self.categories = categories
    collectionView.reloadData()
  }
}
