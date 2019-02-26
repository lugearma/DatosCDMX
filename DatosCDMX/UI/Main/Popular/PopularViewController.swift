//
//  PopularViewController.swift
//  DatosCDMX
//
//  Created by Luis Arias on 2/25/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import UIKit

final class PopularViewController: UIViewController {
  
  @IBOutlet var popularTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .blue
    print(#function)
    setupTableView()
  }
  
  private func setupTableView() {
    popularTableView.delegate = self
    popularTableView.dataSource = self
    popularTableView.rowHeight = 60
    // TODO: Remove strings and add the identifier to a protocol
    popularTableView.register(UINib(nibName: "SimpleDetailCell", bundle: nil), forCellReuseIdentifier: "SimpleDetailCell")
  }
}

extension PopularViewController: UITableViewDataSource {
  
  // TODO: Absctract data source to different class
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleDetailCell", for: indexPath) as? SimpleDetailCell else {
      fatalError()
    }
    
    cell.setupCellContent("hola")
    
    return cell
  }
}

extension PopularViewController: UITableViewDelegate {
  
}
