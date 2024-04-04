//
//  CommentListPresenter.swift
//  MVVM-C-Programmatic
//
//  Created by Murat on 4.04.2024.
//

import Foundation
import UIKit

class CommentListPresenter :NSObject,UITableViewDataSource {

    var comments : [Comment] = []
    
    
    init(comments: [Comment]) {
        self.comments = comments
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.commentCellIdentifier, for: indexPath) as! CommentCell
        
        cell.configure(comment: comments[indexPath.row])
        
        return cell
    }
    
}
