//
//  UserListPresenter.swift
//  MVVM-C-Programmatic
//
//  Created by Kerim Çağlar on 31.03.2024.
//

import Foundation
import UIKit

// Buradaki presenter sınıfını struct olarak tanımlasak kabul edilir miydi sorusuna cevap : Hayır.Çünkü "UITableViewDataSource protokolü class protokol olarak belirlenmiş ve hata veriyor.Bu şekilde verilmesinin nedeni aslında TableViewDataSource semantiginin referans tipine daha uyumlu olmasından kaynaklı.Struct ise değer yapılı olduğundan.Ayrıca NSObject'ten miras alan bir class, Objective-C runtime özelliklerinden ve UIKit'in bazı kısımlarıyla daha iyi entegrasyondan faydalanabilir. UITableViewDataSource protokolünü bir class ile uygulamak, bu entegrasyona olan ihtiyaçtan kaynaklanır. Örneğin, NSObject bazı UIKit bileşenleri tarafından gereken temel davranışları ve yetenekleri sağlar.


class UserListPresenter: NSObject, UITableViewDataSource {
        
    var users: [User]
    var filteredUsers: [User]
    var isFiltered: Bool = false
    
    init(
        users: [User],
        filteredUsers: [User]
    ) {
        self.users = users
        self.filteredUsers = filteredUsers
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltered {
            return filteredUsers.count
        }
        return users.count
    }
    
    //TODO: Define cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.userCellIdentifier, for: indexPath) as! UserCell
        
        cell.configure(user: users[indexPath.row])
        
        return cell
    }
    
    func getUserId(for IndexPath: IndexPath) -> Int {
        let index = IndexPath.row
        if isFiltered {
            users = filteredUsers
        }
        
        guard index < users.count else { return 0 }
        return users[index].id ?? 0
    }
    
}
