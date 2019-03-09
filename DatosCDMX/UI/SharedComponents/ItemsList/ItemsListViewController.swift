//
//  ItemsListViewController.swift
//  DatosCDMX
//
//  Created by Luis Arias on 2/27/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import UIKit

final class ItemsListViewController: UIViewController, Navegable {
  
  @IBOutlet var itemsTableView: UITableView!
  var items: [Dataset] = []
  var navigator: Navigator?
  
  var viewModel: ItemsListViewModel? {
    didSet {
      viewModel?.delegate = self
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    viewModel?.getCategory()
    title = viewModel?.selectedItem ?? ""
  }
  
  private func setupTableView() {
    let nib = UINib(nibName: ItemCell.identifier, bundle: nil)
    itemsTableView.register(nib, forCellReuseIdentifier: ItemCell.identifier)
    itemsTableView.delegate = self
    itemsTableView.dataSource = self
    itemsTableView.estimatedRowHeight = 200
  }
  
  var finishedLoadingInitialTableCells = false
}
// MARK: - UITableViewDataSource

extension ItemsListViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.identifier, for: indexPath) as! ItemCell
    let item = items[indexPath.row]
    cell.setupCell(item)
    
    return cell
  }
}

// MARK: - UITableViewDelegate

extension ItemsListViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    var lastInitialDisplayableCell = false
    
    //change flag as soon as last displayable cell is being loaded (which will mean table has initially loaded)
    if items.count > 0 && !finishedLoadingInitialTableCells {
      if let indexPathsForVisibleRows = tableView.indexPathsForVisibleRows,
        let lastIndexPath = indexPathsForVisibleRows.last, lastIndexPath.row == indexPath.row {
        lastInitialDisplayableCell = true
      }
    }
    
    if !finishedLoadingInitialTableCells {
      
      if lastInitialDisplayableCell {
        finishedLoadingInitialTableCells = true
      }
      
      //animates the cell as it is being displayed for the first time
      let rowHeight = cell.bounds.size.height
    
      cell.transform = CGAffineTransform(translationX: 0, y: rowHeight/2)
      cell.alpha = 0
      
      UIView.animate(withDuration: 0.5, delay: 0.05*Double(indexPath.row), options: [.curveEaseInOut], animations: {
        cell.transform = CGAffineTransform(translationX: 0, y: 0)
        cell.alpha = 1
      }, completion: nil)
    }
  }
}

// MARK: - ItemsListViewModelDelegate

extension ItemsListViewController: ItemsListViewModelDelegate {
  
  func didThrowError(_ error: Error) {
    print(error.localizedDescription)
  }
  
  func didReceiveItems(_ items: [Dataset]) {
    self.items = items
    itemsTableView.reloadData()
  }
}
