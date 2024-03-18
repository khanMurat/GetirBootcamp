//
//  ViewController.swift
//  HWSearch
//
//  Created by Murat on 18.03.2024.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var searchView: SearchView!
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
    }
    
    //MARK: - Helpers
    
    func configureTableView(){
        self.tableView._registerCell = RecentTableViewCell.self
    }
}


//MARK: - UITableViewDelegate & UITableViewDataSource

extension HomeViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : RecentTableViewCell = tableView._dequeueReusableCell()
        
        cell.recentWordLabel.text = "Apple"
        
        return cell
    }
}
