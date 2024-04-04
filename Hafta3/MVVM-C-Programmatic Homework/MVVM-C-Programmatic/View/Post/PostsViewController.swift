//
//  PostsViewController.swift
//  MVVM-C-Programmatic
//
//  Created by Kerim Çağlar on 31.03.2024.
//

import UIKit
import RxSwift

class PostsViewController: UIViewController {
    
    let postVM = PostVM()
    
    let disposeBag = DisposeBag()
    
    var userID : Int?
    
    private lazy var postList : PostListPresenter = {
        let config = PostListPresenter(posts: [])
        return config
    }()
    
    private let tableView : UITableView = {
        let tv = UITableView()
        return tv
    }()
    
    init(userID: Int? = nil) {
        self.userID = userID
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let userID = userID else {return}
        
        postVM.fetchUsersPost(id: userID).subscribe { [weak self] posts in
            
            guard let self else {return}
            
            self.postList.posts = posts
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
        
        tableView.register(PostCell.self, forCellReuseIdentifier: Constants.postCellIdentifier)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = postList
                
        postList.showBtnHandler = { [weak self] id in
            
            guard let postID = id else {return}
            
            let vc = CommentsViewController(postID: postID)
            
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        
        navigationItem.title = "Posts"
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

extension PostsViewController: UITableViewDelegate {
    
}

