//
//  CastingViewController.swift
//  MediaTrend
//
//  Created by Woochan Park on 2021/10/19.
//

import UIKit

final class CastingViewController: UIViewController {

  @IBOutlet private weak var castingTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpCastingTableView()
  }

  private func setUpCastingTableView() {
    castingTableView.delegate = self
    castingTableView.dataSource = self
    
    let castingCellNib = UINib(nibName: CastingTableViewCell.nibName, bundle: nil)
    castingTableView.register(castingCellNib, forCellReuseIdentifier: CastingTableViewCell.identifier)
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
