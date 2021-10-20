//
//  CastingViewController.swift
//  MediaTrend
//
//  Created by Woochan Park on 2021/10/19.
//

import UIKit

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
  
  var tvShowData: TvShow? {
    
    didSet {
      // TODO: 여기서 호출하면 안되는 이유
      // movieTitleLabel 이 아직 초기화 안되어있는 시점임
      // IBOutlet 은 viewDidLoad 부터 안전하게 사용할 수 있다.
//      setUpTableViewHeader(with: tvShowData)
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    setUpTableViewHeader(with: tvShowData)
//    castingTableView.rowHeight = UITableView.automaticDimension
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
    
    URLSession.shared.dataTask(with: imageURL!) { data, response, error in
      
      if let error = error {
        print(error.localizedDescription)
        return
      }
      
      guard let response = response as? HTTPURLResponse else { return }
      
      guard (200...299).contains(response.statusCode) else { return }
      
      if let data = data {
        DispatchQueue.main.async { [weak self] in
          guard let self = self else { return }
          self.backDropImageView.image = UIImage(data: data)
        }
      }
 
    }.resume()
    
    
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
