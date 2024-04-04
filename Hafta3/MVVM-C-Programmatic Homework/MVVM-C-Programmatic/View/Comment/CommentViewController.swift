//
//  CommentViewController.swift
//  MVVM-C-Programmatic
//
//  Created by Kerim Çağlar on 31.03.2024.
//

import UIKit
import RxSwift

class CommentsViewController: UIViewController {
    
    let commentVM = CommentVM()
    
    let disposeBag = DisposeBag()
    
    var postID : Int?
    
    private lazy var commentList : CommentListPresenter = {
        let config = CommentListPresenter(comments: [])
        return config
    }()
    
    private let tableView : UITableView = {
        let tv = UITableView()
        return tv
    }()
    
    init(postID: Int? = nil) {
        self.postID = postID
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let postID = postID else {return}
        
        commentVM.fetchPostsComments(id: postID).subscribe { [weak self] comments in
            
            guard let self else {return}
            
            self.commentList.comments = comments
            self.tableView.reloadData()
        } onError: { error in
            print(error.localizedDescription)
        } onCompleted: {
            print("Completed")
        } onDisposed: {
            print("Disposed")
        }.disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureProperties()
        configureLayout()
        
    }
    
    private func configureProperties(){
        
        tableView.register(CommentCell.self, forCellReuseIdentifier: Constants.commentCellIdentifier)
        
        tableView.rowHeight = 125
        tableView.delegate = self
        tableView.dataSource = commentList
                
        navigationItem.title = "Comments"
    }
    
    private func configureLayout(){
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
    
}

extension CommentsViewController: UITableViewDelegate {
    
}


