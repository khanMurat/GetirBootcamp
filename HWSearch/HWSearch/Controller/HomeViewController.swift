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
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchButtonBottomConstraint: NSLayoutConstraint!
    
    //MARK: - Properties
    
    private var recentValues : [DatabaseModel] = []{
        didSet{self.tableView.reloadData()}
    }
    private let viewModel = HomeViewModel()
    private var refresher = UIRefreshControl()
    private var text      = ""
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureRefresher()
        setupKeyboardNotifications()
        viewModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: - Actions
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            searchButtonBottomConstraint.constant = keyboardSize.height
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        searchButtonBottomConstraint.constant = 0
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func refreshController(){
        fetchData()
        self.refresher.endRefreshing()
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        text = searchView.searchTextField.text!
        
        viewModel.checkSearchText(searchText: text) { isTrue in
            if isTrue {
                self.viewModel.addRecentWordToDatabase(recentValue: text)
                self.performSegue(withIdentifier: "toDetail", sender: nil)
                self.searchView.searchTextField.text = ""
            }else{
                self.showErrorAlert(message: "Please enter a word!")
            }
        }
    }
    
    //MARK: - Helpers
    
    func configureTableView(){
        self.tableView._registerCell = RecentTableViewCell.self
        self.tableView.refreshControl = refresher
    }
    
    func configureRefresher(){
        self.refresher.addTarget(self, action: #selector(refreshController), for: .valueChanged)
    }
    
    func setupKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func fetchData(){
        viewModel.getRecentWordFromDatabase()
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailViewController {
            vc.word = self.text
        }
    }
}

//MARK: - UITableViewDelegate & UITableViewDataSource

extension HomeViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : RecentTableViewCell = tableView._dequeueReusableCell()
        cell.recentWordLabel.text = recentValues[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.text = recentValues[indexPath.row].name
        performSegue(withIdentifier: "toDetail", sender: nil)
    }
}

extension HomeViewController : HomeViewModelDelegate {
    func didReceiveTableData(_ values: [DatabaseModel]) {
        self.recentValues = values
    }
    
    func didFailWithError(_ error: NetworkError) {
        
    }
}
