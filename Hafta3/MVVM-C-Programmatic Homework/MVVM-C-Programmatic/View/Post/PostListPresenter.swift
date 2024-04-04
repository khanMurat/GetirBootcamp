//
//  PostListPresenter.swift
//  MVVM-C-Programmatic
//
//  Created by Murat on 4.04.2024.
//

import Foundation
import UIKit

class PostListPresenter :NSObject,UITableViewDataSource {

    var posts : [Post] = []
    
    var showBtnHandler: ((Int?) -> Void)?
    
    init(posts: [Post]) {
        self.posts = posts
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.postCellIdentifier, for: indexPath) as! PostCell
        
        cell.configure(post: posts[indexPath.row])
        
        cell.post = posts[indexPath.row]
        
        cell.contentView.isUserInteractionEnabled = false // -> Bu kod olmadığında cell içerisindeki butona tıklama olayını algılayamıyor.Sanıyorum ki button üzerindeki view butonu örtüyor ve tıklanmasını engelliyor.
        
        cell.showBtnHandler = self.showBtnHandler
        
        return cell
    }
    
}
