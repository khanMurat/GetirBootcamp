//
//  SearchBarViewController.swift
//  Getir-Basic-Components
//
//  Created by Kerim Çağlar on 24.03.2024.
//

import UIKit

class SearchBarViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var users = [User]()
    var filteredUsers = [User]()
    var isFiltering: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let urlString = "https://jsonplaceholder.typicode.com/users"
        guard let userListURL = URL(string: urlString) else { return }
        
        let users = try? JSONDecoder().decode([User].self, from: Data(contentsOf: userListURL))
        guard let users else { return }
        self.users = users
        
    }

}

extension SearchBarViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                
        if isFiltering {
            
            if filteredUsers.count == 0 {
                self.tableView.setEmptyMessage("No users found!")
            } else {
                self.tableView.restore()
            }
            
            return filteredUsers.count
        }
        
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        
        if isFiltering {
            cell.textLabel?.text = filteredUsers[indexPath.row].name
        } else {
            cell.textLabel?.text = users[indexPath.row].name
        }
        
        return cell
        
    }
    
}

extension SearchBarViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        isFiltering = true
        
        
         //MARK: - search bar daki x e basınca filtered content silinsin
        
        if searchText == "" {
            isFiltering = false
            filteredUsers = []
            self.tableView.reloadData()
        }
        
        filteredUsers = users.filter({ user -> Bool in
            return user.name?.lowercased().contains(searchText.lowercased()) ?? false
        })
        
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isFiltering = false
        searchBar.text = ""
        filteredUsers = [User]()
        tableView.reloadData()
    }
}

