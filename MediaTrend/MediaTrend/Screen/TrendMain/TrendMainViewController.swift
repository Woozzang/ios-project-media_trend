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
  let webSegueIdentifier = "WebSegue"
  
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
  
  @objc func didTapLinkButton(sender: UIButton) {
    print(#function)
    performSegue(withIdentifier: webSegueIdentifier, sender: sender)
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
    
    cell.setUpCell(with: tvShowData)
    
    cell.linkButton.addTarget(self, action: #selector(didTapLinkButton), for: .touchUpInside)
    cell.linkButton.tag = indexPath.row
    
    return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    switch segue.destination {
      
      case let searchVC as SearchViewController:
        
        searchVC.modalPresentationStyle = .fullScreen
      
      case let castingVC as CastingViewController:
        
        guard let tvShowData = sender as? TvShow else { assertionFailure(); return }
        
        castingVC.tvShowData = tvShowData
        
      case let nav as UINavigationController :
        
        if let webVC = nav.viewControllers.first as? WebViewController {
          
          guard let linkButton = sender as? UIButton else {
            assertionFailure()
            return
          }
          
          webVC.title = tvShowManager.tvShowList[linkButton.tag].title
        }

      default:
        return
    }
  }
}

extension TrendMainViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    return 427
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    performSegue(withIdentifier: castingSegueIdentifier, sender: tvShowManager.tvShowList[indexPath.row])
  }
}

//enum Movie
