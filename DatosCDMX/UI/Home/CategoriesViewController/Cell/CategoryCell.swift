//
//  CategoryCell.swift
//  DatosCDMX
//
//  Created by Luis Arias on 1/24/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import UIKit

final class CategoryCell: UICollectionViewCell {
  
  static let identifier = "CategoryCellIdentifier"
  
  @IBOutlet var categoryNameLabel: UILabel!
  @IBOutlet var categoryImageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func setupCellWith(category: Facet) {
    
  }
}
