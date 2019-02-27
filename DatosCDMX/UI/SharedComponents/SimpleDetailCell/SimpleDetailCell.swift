//
//  SimpleDetailCell.swift
//  DatosCDMX
//
//  Created by Luis Arias on 2/25/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import UIKit

enum CategoryImage {
  case calendar
}

extension CategoryImage {
  var detailImage: UIImage {
    switch self {
    case .calendar:
      return UIImage(named: "calendar")!
    }
  }
}

final class SimpleDetailCell: UITableViewCell {
  
  @IBOutlet var categoryImageView: UIImageView!
  @IBOutlet var descriptionLabel: UILabel!
  @IBOutlet var detailLabel: UILabel!
  @IBOutlet var detailImageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func setupCellContent(meta: Metas, category: CategoryImage) {
    descriptionLabel.text = meta.title
    detailLabel.text = meta.publisher
    detailImageView.image = category.detailImage
  }
}
