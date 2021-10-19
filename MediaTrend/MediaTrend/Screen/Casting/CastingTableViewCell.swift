//
//  CastingTableViewCell.swift
//  MediaTrend
//
//  Created by Woochan Park on 2021/10/19.
//

import UIKit

class CastingTableViewCell: UITableViewCell {
  
  static var identifier = "CastingTableViewCell"
  
  static var nibName: String {
    
    return identifier
  }
  
  @IBOutlet weak var mainImageView: UIImageView!
  
  @IBOutlet weak var nameLabel: UILabel!
  
  @IBOutlet weak var descriptionLabel: UILabel!
  

}
