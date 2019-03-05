//
//  MenuViewController.swift
//  DatosCDMX
//
//  Created by Luis Arias on 2/27/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import UIKit


// TODO: Remove this structure from here
struct MenuItem {
  let description: String
  let index: Int
  var image: UIImage? {
    var imageName = "placeholder"
    switch index {
    case 0: imageName = "train"
    case 1: imageName = "buildings"
    case 2: imageName = "leaf"
    case 3: imageName = "justice"
    case 4: imageName = "coins"
    case 5: imageName = "worker"
    case 6: imageName = "supreme"
    case 7: imageName = "antena"
    case 8: imageName = "school"
    case 9: imageName = "health"
    default: break
    }
    return UIImage(named: imageName)
  }
}

final class MenuViewController: UIViewController {
  
  @IBOutlet var menuCollectionView: UICollectionView!
  
  var menuItems: [MenuItem] = []
  var viewModel: MenuViewModel? {
    didSet {
      viewModel?.delegate = self
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
    setupNavigationBar()
    viewModel?.getCategories()
  }
  
  private func setupNavigationBar() {
    title = "Categories"
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  private func setupCollectionView() {
    menuCollectionView.dataSource = self
    menuCollectionView.delegate = self
    menuCollectionView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
    let nib = UINib(nibName: MenuCell.identifier, bundle: nil)
    menuCollectionView.register(nib, forCellWithReuseIdentifier: MenuCell.identifier)
  }
}

// MARK: - UICollectionViewDataSource

extension MenuViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return menuItems.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCell.identifier, for: indexPath) as! MenuCell
    let menuItem = menuItems[indexPath.row]
    cell.setupCell(menuItem)
    return cell
  }
}

// MARK: - UICollectionViewDelegate

extension MenuViewController: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let cell = collectionView.cellForItem(at: indexPath) as? MenuCell
    let itemListViewController = ViewControllerFactory.makeItemsListViewController()
    navigationController?.pushViewController(itemListViewController, animated: true)
  }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MenuViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let cellWidth = (collectionView.bounds.width - 20) / 2
    
    return CGSize(width: cellWidth, height: cellWidth)
  }
}

//MARK: - MenuViewModelDelegate

extension MenuViewController: MenuViewModelDelegate {
  
  func didThrow(_ error: Error) {
    print(error.localizedDescription)
  }
  
  func didReceiveMenuItems(_ menuItems: [MenuItem]) {
    self.menuItems = menuItems
    menuCollectionView.reloadData()
  }
}
