//
//  DetailViewController.swift
//  HWSearch
//
//  Created by Murat on 18.03.2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    
    var word : String?
    private let viewModel = DetailViewModel()
    private var meanings = [Meaning]()
    private lazy var headerView = DetailHeaderView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 80))
    private lazy var footerView = DetailFooterView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 150))
    
    //MARK: - Lifecyle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        configureTableView()
        backButton()
    }
    
    func getData(){
        guard let word = word else {return}
        viewModel.getDataAboutWord(word: word)
        viewModel.delegate = self
    }
    
    func configureTableView(){
        self.tableView._registerCell = DetailTableViewCell.self
        self.tableView.tableHeaderView = headerView
        self.tableView.tableFooterView = footerView
    }
}

//MARK: - UITableViewDelegate & UITableViewDataSource

extension DetailViewController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return meanings.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meanings[section].definitions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : DetailTableViewCell = tableView._dequeueReusableCell()
        let meaning = meanings[indexPath.section]
        let partOfSpeech = meaning.partOfSpeech.capitalized
        cell.typeLabel.text = "\(indexPath.row + 1)-\(partOfSpeech)"
        cell.descpLabel.text = meaning.definitions[indexPath.row].definition
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension DetailViewController : DetailViewModelDelegate {
    func didReceiveFooterData(_ footerData: [SynonymModel]) {
        footerView.synonyms = footerData
        footerView.collectionView.reloadData()
    }
    
    func didReceiveHeaderData(_ viewModel: DetailHeaderViewModel) {
        headerView.configureHeaderView(viewModel: viewModel)
    }
    
    func didReceiveTableData(_ meanings: [Meaning]) {
        self.meanings = meanings
        self.tableView.reloadData()
    }
    
    func didFailWithError(_ error: NetworkError) {
        showErrorAlert(message: error.title) {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
