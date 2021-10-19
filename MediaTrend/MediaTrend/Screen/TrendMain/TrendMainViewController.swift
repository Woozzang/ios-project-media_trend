//
//  TrendMainViewController.swift
//  MediaTrend
//
//  Created by Woochan Park on 2021/10/19.
//

import UIKit

class TrendMainViewController: UIViewController {
  
  // TODO: HeaderView 분리
  
  @IBOutlet weak var buttonStackShadowView: UIView! {
    didSet {
      
      buttonStackShadowView.layer.cornerRadius = 10
      
      buttonStackShadowView.layer.masksToBounds = false
      
      buttonStackShadowView.layer.borderColor = UIColor.lightGray.cgColor
      
      buttonStackShadowView.layer.borderWidth = 1
      
      buttonStackShadowView.layer.shadowOpacity = 0.5
      
      buttonStackShadowView.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
  }
  
  @IBOutlet weak var buttonStackBackView: UIView! {
    didSet {
      
      buttonStackBackView.layer.cornerRadius = 10
      
      buttonStackBackView.clipsToBounds = true
    }
  }  
  
  @IBOutlet weak var mainTableView: UITableView!
  
  private var tvShowManager: TvShowManager
  
  required init?(coder: NSCoder) {
    
    tvShowManager = TvShowManager.shared
    
    super.init(coder: coder)
  }
  
  let castingSegueIdentifier = "CastingSegue"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpMainTableView()
  }
  
  private func setUpMainTableView() {
    mainTableView.delegate = self
    mainTableView.dataSource = self
  }
  
  
  @IBAction func didTapSearchButton(_ sender: Any) {
    print(#function)
  }
}

extension TrendMainViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tvShowManager.tvShowList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: TrendMainTableViewCell.identifier, for: indexPath) as? TrendMainTableViewCell else {
      return UITableViewCell()
    }
    
    let tvShowData = tvShowManager.tvShowList[indexPath.row]
    
    cell.setUpCell(with: tvShowData) { [weak self] in
      
      let vc = UIViewController()
      vc.view.backgroundColor = .white
      
      self?.present(vc, animated: true, completion: nil)
    }
    
    return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if let vc = segue.destination as? SearchViewController {
      vc.modalPresentationStyle = .fullScreen
    }
  }
}

extension TrendMainViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    return 427
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    performSegue(withIdentifier: castingSegueIdentifier, sender: nil)
  }
}

//enum Movie
