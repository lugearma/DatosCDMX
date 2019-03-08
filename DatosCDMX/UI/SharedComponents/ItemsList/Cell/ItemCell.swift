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
  @IBOutlet weak var clasificationStackView: UIStackView!
  
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
    appendKeywordToStackView(data)
  }
  
  private func appendKeywordToStackView(_ data: Dataset) {
    if let keywords = data.metas?.keyword as? Array<String> {
      for keyword in keywords {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.backgroundColor = .lightGray
        label.text = "  " + keyword + "  "
        label.textColor = .white
        label.roundCorners()
        clasificationStackView.addArrangedSubview(label)
      }
    } else if let keyword = data.metas?.keyword as? String {
      let label = UILabel()
      label.text = keyword
      label.roundCorners()
      clasificationStackView.addArrangedSubview(label)
    }
  }
}

extension UIView {
  func roundCorners() {
    layer.cornerRadius = 3.0
    layer.masksToBounds = true
  }
}
