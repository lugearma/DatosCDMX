//
//  ItemCell.swift
//  DatosCDMX
//
//  Created by Luis Arias on 2/27/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import UIKit

final class ItemCell: UITableViewCell {
  
  @IBOutlet weak var categoryImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionTextView: UITextView!
  @IBOutlet weak var publisherLabel: UILabel!
  @IBOutlet weak var backView: UIView!
  
  static let identifier = "ItemCell"
  
  override func awakeFromNib() {
    super.awakeFromNib()
    backView.layer.cornerRadius = 3
    backView.layer.borderColor = UIColor.lightGray.cgColor
    backView.layer.borderWidth = 0.5
  }
  
  func setupCell(_ data: Dataset) {
    let info = data.metas
    titleLabel.text = info?.title
    descriptionTextView.text = info?.description?.cleanTags()
    publisherLabel.text = info?.publisher
    let image = UIImage(named: info?.imageName ?? "placeholder")
    categoryImageView.image = image
  }
}
