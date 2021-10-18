//
//  UILabel+IntrinsicSize.swift
//  MediaTrend
//
//  Created by Woochan Park on 2021/10/19.
//

import UIKit

extension UILabel {
  
  open override var intrinsicContentSize: CGSize {
    
    let originalContentSize = super.intrinsicContentSize
    
    let horizontalPadding: CGFloat = 3
    
    return CGSize(width: originalContentSize.width + (horizontalPadding * 2), height: originalContentSize.height)
  }
}
