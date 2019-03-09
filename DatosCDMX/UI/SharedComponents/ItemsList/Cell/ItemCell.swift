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
  
  var data: Dataset?
  
  static let identifier = "ItemCell"
  
  override func awakeFromNib() {
    super.awakeFromNib()
    backView.roundCorners()
    backView.layer.borderColor = UIColor.lightGray.cgColor
    backView.layer.borderWidth = 0.5
    
    selectionStyle = .none
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
  
  private func getCategoryKeyword(_ data: Dataset) -> [String] {
    if let keywords = data.metas?.keyword as? [String] {
      return keywords
    } else if let keyword = data.metas?.keyword as? String {
      return [keyword]
    }
    
    return []
  }
  
  private func appendKeywordToStackView(_ data: Dataset) {
    cleanPresentedLabels()
    let keywords = getCategoryKeyword(data)
    let labels = buildCategoryLabels(keywords)
  
    labels.forEach { label in
      self.clasificationStackView.addArrangedSubview(label)
    }
  }
  
  private func buildCategoryLabels(_ keywords: [String]) -> [UILabel]{
    var categoryLabels: [UILabel] = []
    for keyword in keywords {
      let label = UILabel()
      label.font = UIFont.boldSystemFont(ofSize: 10)
      label.backgroundColor = .lightGray
      label.text = "  " + keyword + "  "
      label.textColor = .white
      label.roundCorners()
      categoryLabels.append(label)
    }
    
    return categoryLabels
  }
  
  private func cleanPresentedLabels() {
    let categoryLabels = clasificationStackView.arrangedSubviews
    for label in categoryLabels {
      clasificationStackView.removeArrangedSubview(label)
      label.removeFromSuperview()
    }
  }
}

extension UIView {
  func roundCorners() {
    layer.cornerRadius = 3.0
    layer.masksToBounds = true
  }
}
