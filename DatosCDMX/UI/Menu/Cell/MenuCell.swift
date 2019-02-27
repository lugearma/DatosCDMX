//
//  MenuCell.swift
//  DatosCDMX
//
//  Created by Luis Arias on 2/27/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import UIKit

final class MenuCell: UICollectionViewCell {
  
  static let identifier = "MenuCell"
  
  @IBOutlet var headerImageView: UIImageView!
  @IBOutlet var descriptionLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    layer.cornerRadius = 5
    layer.borderWidth = 0.5
    layer.borderColor = UIColor.lightGray.cgColor
  }
  
  func setupCell(_ menuItem: MenuItem) {
    headerImageView.image = menuItem.image
    descriptionLabel.text = menuItem.description
  }
}
