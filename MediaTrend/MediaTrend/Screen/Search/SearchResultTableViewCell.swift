//
//  SearchResultTableViewCell.swift
//  MediaTrend
//
//  Created by Woochan Park on 2021/10/19.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {
  
  static var identifier = "SearchResultTableViewCell"
  
  static var nibName: String {
    return identifier
  }
  
  @IBOutlet weak var thumbnailImageView: UIImageView!
  
  @IBOutlet weak var titleLabel: UILabel!
  
  @IBOutlet weak var resultLabel: UILabel!
  
  @IBOutlet weak var summaryLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
      // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
}
