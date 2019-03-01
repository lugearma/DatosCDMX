//
//  ItemsListViewController.swift
//  DatosCDMX
//
//  Created by Luis Arias on 2/27/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import UIKit

final class ItemsListViewController: UIViewController {
  
  @IBOutlet var itemsTableView: UITableView!
  var items: [Category] = []
  var viewModel: ItemsListViewModel? {
    didSet {
      viewModel?.delegate = self
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    viewModel?.getCategory()
  }
  
  private func setupTableView() {
    let nib = UINib(nibName: "ItemCell", bundle: nil)
    itemsTableView.register(nib, forCellReuseIdentifier: ItemCell.identifier)
    itemsTableView.delegate = self
    itemsTableView.dataSource = self
    itemsTableView.estimatedRowHeight = 100
    itemsTableView.rowHeight = UITableView.automaticDimension
  }
}

//MARK: - UITableViewDataSource

extension ItemsListViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.identifier, for: indexPath) as! ItemCell
    if indexPath.row % 2 == 0 {
      cell.setupCell(
        """
      Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna
      """
      )
    }

    
//    let item = items[indexPath.row]
    return cell
  }
}

// MARK: - UITableViewDelegate

extension ItemsListViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let cell = tableView.cellForRow(at: indexPath)
    
//    let descriptionTextView = cell?.descriptionTextView
//    let sizeThatFitsTextView = descriptionTextView?.sizeThatFits((descriptionTextView?.bounds.size)!)
//    let heightOfText = sizeThatFitsTextView!.height
//    print("🥶🥶🥶", heightOfText)
//    return heightOfText
    
    return 250
  }
}

// MARK: - ItemsListViewModelDelegate

extension ItemsListViewController: ItemsListViewModelDelegate {
  
  func didThrowError(_ error: Error) {
    print(error.localizedDescription)
  }
  
  func didReceiveCategory() {
  
  }
}
