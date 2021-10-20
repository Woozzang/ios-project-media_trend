//
//  CastingViewController.swift
//  MediaTrend
//
//  Created by Woochan Park on 2021/10/19.
//

import UIKit
import Kingfisher

final class CastingViewController: UIViewController {

  @IBOutlet weak var backDropImageView: UIImageView! {
    didSet {
      backDropImageView.contentMode = .scaleAspectFill
    }
  }
  
  @IBOutlet weak var posterImageView: UIImageView! {
    didSet {
      posterImageView.contentMode = .scaleAspectFill
    }
  }
  
  @IBOutlet weak var movieTitleLabel: UILabel!
  
  @IBOutlet private weak var castingTableView: UITableView!
  
  var tvShowData: TvShow?

  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.navigationBar.tintColor = .black
    
    setUpTableViewHeader(with: tvShowData)
    setUpCastingTableView()
  }

  private func setUpCastingTableView() {
    castingTableView.delegate = self
    castingTableView.dataSource = self
    
    let castingCellNib = UINib(nibName: CastingTableViewCell.nibName, bundle: nil)
    castingTableView.register(castingCellNib, forCellReuseIdentifier: CastingTableViewCell.identifier)
  }
  
  private func setUpTableViewHeader(with data: TvShow?) {
    
    guard let tvShowData = data else { return }
    
    let imageURL = URL(string: tvShowData.backdropImage)

    self.backDropImageView.kf.setImage(with: imageURL)
    
    posterImageView.image = UIImage(named: tvShowData.title)
    movieTitleLabel.text = tvShowData.title
  }
}

// MARK: - UITableViewDataSource
extension CastingViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: CastingTableViewCell.identifier, for: indexPath) as? CastingTableViewCell else { return UITableViewCell() }
    
    return cell
  }
  
  
}

extension CastingViewController: UITableViewDelegate {
  
}
