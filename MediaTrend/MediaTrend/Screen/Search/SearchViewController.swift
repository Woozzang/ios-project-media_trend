//
//  SearchViewController.swift
//  MediaTrend
//
//  Created by Woochan Park on 2021/10/19.
//

import UIKit

class SearchViewController: UIViewController {
  
  @IBOutlet weak var searchBar: UISearchBar!
  
  @IBOutlet weak var resultTableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpSearchBar()
    setUpResultTableView()
  }
  
  func setUpResultTableView() {
    resultTableView.delegate = self
    resultTableView.dataSource = self
    
    // Register Cells
    let resultCellNib = UINib(nibName: SearchResultTableViewCell.nibName, bundle: nil)
    
    resultTableView.register(resultCellNib, forCellReuseIdentifier: SearchResultTableViewCell.identifier)
  }
  
  func setUpSearchBar() {
    
  }
  
  @IBAction func onClose(_ sender: Any) {
    
    self.dismiss(animated: true, completion: nil)
  }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.identifier, for: indexPath) as? SearchResultTableViewCell else { return UITableViewCell() }
    
    return cell
  }
}


