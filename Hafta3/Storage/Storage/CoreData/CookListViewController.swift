//
//  CookListViewController.swift
//  Storage
//
//  Created by Kerim Çağlar on 30.03.2024.
//

import UIKit
import CoreData

class CookListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cookDictionary : [String:Any] = [:]
    
//    var cookNames = [String]() {
//        didSet {
//            tableView.reloadData()
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 70
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getCooks()
    }
    
    private func getCooks() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Cooks")
        
        do {
            let results = try context.fetch(fetchRequest)
            
            if !results.isEmpty {
                for result in results as! [NSManagedObject] {
                    guard let name = result.value(forKey: "name") as? String else { return }
                    guard let image = result.value(forKey: "image") as? Data else {return}
                
                    cookDictionary[name] = image
                }
                tableView.reloadData()
            } else {
                // Alert ile veri kaydı bulunamadı
                
                let alertVC = UIAlertController(title: "Error", message: "Veri kaydı bulunumadı", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertVC.addAction(okAction)

                self.present(alertVC, animated: true)
            }
            
        } catch {
            print("Veriler çekilemedi")
        }
    }

}

extension CookListViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cookDictionary.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cookCell", for: indexPath) as! CookTableViewCell
        
        let keys = Array(cookDictionary.keys)
        let imageData = cookDictionary[keys[indexPath.row]] as? Data
     
        cell.cookName.text = keys[indexPath.row]
        cell.cookImage.image = UIImage(data: imageData ?? Data())
    
        return cell
    }
    
    
}

//HW: Imageview alanını da oluşturup orada ilgili image ı gösteriniz.
