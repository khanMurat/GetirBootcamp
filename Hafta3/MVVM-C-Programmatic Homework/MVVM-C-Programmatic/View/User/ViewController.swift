//
//  ViewController.swift
//  MVVM-C-Programmatic
//
//  Created by Kerim Çağlar on 31.03.2024.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    let userVM = UserVM()
    
    
    private lazy var userList: UserListPresenter = {
        let config = UserListPresenter(users: [], filteredUsers: [])
        return config
    }()
    
    let disposeBag = DisposeBag()
    private let tableView = UITableView()
    
    var userID : Int?
    
    let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Search User"
        return searchController
    }()
    
    var isSearchBarEmpty: Bool {
        searchController.searchBar.text?.isEmpty ?? true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        userVM.fetchRemoteUsers().subscribe { [weak self] users in
            guard let self else { return }
            self.userList.users = users
            self.tableView.reloadData()
        } onError: { error in
            print(error.localizedDescription)
        } onCompleted: {
            print("Completed")
        } onDisposed: {
            print("Completed")
        }.disposed(by: disposeBag)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureProperties()
        configureLayout()
    }
    
    private func configureProperties() {
        
        tableView.register(UserCell.self, forCellReuseIdentifier: Constants.userCellIdentifier) //TODO: Table view cell register
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = userList
        navigationItem.title = "Users"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = true
    }
    
    private func configureLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
    }
    
    // BKNZ -> Bir view'ın alt görünümlerinin düzenlenmesi için ( animasyonlar,constraintler vb) kullanılan fonksiyondur.
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func filterContentForSearchText(_ searchText: String) {
        userList.filteredUsers = userList.users.filter({ (user: User) -> Bool in
            userList.isFiltered = searchController.isActive && !isSearchBarEmpty
            guard let name = user.name else { return false }
            return name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.userID = userList.getUserId(for: indexPath)
        
        let viewController = PostsViewController(userID: self.userID)
        
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
}

extension ViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
    
}
