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
  
  
  static let identifier = "ItemCell"
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func setupCell(_ fakeString: String) {
    descriptionTextView.text = fakeString
  }
}
