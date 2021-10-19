//
//  TrendMainTableViewCell.swift
//  MediaTrend
//
//  Created by Woochan Park on 2021/10/19.
//

import UIKit

final class TrendMainTableViewCell: UITableViewCell {
  
  static var identifier = "TrendMainTableViewCell"
  
  @IBOutlet private weak var releaseDateLabel: UILabel!
  
  @IBOutlet private weak var genreLabel: UILabel!
  
  @IBOutlet weak var linkButton: UIButton! {
    
    didSet {
      linkButton.layer.cornerRadius = linkButton.bounds.height / 2
    }
  }
  
  private var linkButtonAction: (() -> ())?
  
  @IBOutlet private weak var shadowView: UIView! {
    
    didSet {
      
      shadowView.layer.masksToBounds = false
      
      shadowView.layer.cornerRadius = 10
      
      shadowView.layer.borderColor = UIColor.lightGray.cgColor
      
      shadowView.layer.borderWidth = 1
      
      shadowView.layer.shadowOpacity = 0.5
      
      shadowView.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
  }
  
  @IBOutlet private weak var movieInfoStackBackView: UIView! {
    
    didSet {
      
      movieInfoStackBackView.clipsToBounds = true
      
      movieInfoStackBackView.layer.cornerRadius = 10
    }
  }
  
  @IBOutlet private weak var posterImageView: UIImageView!
  
  @IBOutlet private weak var ratingLabel: HorizontalPaddedLabel!
  
  @IBOutlet private weak var titleLabel: UILabel!
  
  @IBOutlet private weak var starringLabel: UILabel!
  
  /**
    TvShow 데이터를 이용해 셀 콘텐츠를 구성한다.
   */
  
  internal func setUpCell(with tvShowData: TvShow, linkButtonAction: @escaping () -> ()) {
    
    releaseDateLabel.text = tvShowData.releaseDate
    
    genreLabel.text = "#\(tvShowData.genre)"
    
    posterImageView.backgroundColor = .lightGray
    
    UIImage(data: <#T##Data#>)
    
    ratingLabel.text = "\(tvShowData.rate)"
    
    starringLabel.text = tvShowData.starring
    
    titleLabel.text = tvShowData.title
    
    self.linkButtonAction = linkButtonAction
    
    linkButton.addTarget(self, action: #selector(didTapLinkButton), for: .touchUpInside)
  }
  
  @objc func didTapLinkButton() {
    linkButtonAction?()
  }

}
