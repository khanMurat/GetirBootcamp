//
//  NewsViewController.swift
//  Getir-Basic-Components
//
//  Created by Kerim Çağlar on 23.03.2024.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var news = [News]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        
        let news1 = News(imageView: #imageLiteral(resourceName: "sut-helvasi"), title: "Title 1", detail: "Detail 1")
        let news2 = News(imageView: #imageLiteral(resourceName: "etli-ekmek"), title: "Title 2", detail: "Detail 2")
        let news3 = News(imageView: #imageLiteral(resourceName: "lokum"), title: "Title 3", detail: "Detail 3")
        
        news = [news1, news2, news3]
    }

}

extension NewsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        news.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsCell", for: indexPath) as! NewsCell
        
        cell.setup(model: news[indexPath.row])
        
        return cell
    }
    
}
