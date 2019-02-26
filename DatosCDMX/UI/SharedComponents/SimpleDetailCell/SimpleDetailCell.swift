//
//  SimpleDetailCell.swift
//  DatosCDMX
//
//  Created by Luis Arias on 2/25/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import UIKit

final class SimpleDetailCell: UITableViewCell {
  
  @IBOutlet var categoryImageView: UIImageView!
  @IBOutlet var descriptionLabel: UILabel!
  @IBOutlet var detailLabel: UILabel!
  @IBOutlet var detailImageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func setupCellContent(_  detail: String) {
    detailLabel.text = detail
  }
}
