//
//  HorizontalPaddedLabel.swift
//  MediaTrend
//
//  Created by Woochan Park on 2021/10/19.
//

import UIKit

class HorizontalPaddedLabel: UILabel {
  
  override var intrinsicContentSize: CGSize {
    
    let originalContentSize = super.intrinsicContentSize
    
    let horizontalPadding: CGFloat = 5
    
    return CGSize(width: originalContentSize.width + (horizontalPadding * 2), height: originalContentSize.height)
  }
}

