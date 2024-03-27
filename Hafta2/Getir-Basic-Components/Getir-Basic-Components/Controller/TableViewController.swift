//
//  TableViewController.swift
//  Getir-Basic-Components
//
//  Created by Kerim Çağlar on 23.03.2024.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
   /* var cities = ["Ankara", "Tokat", "İzmir", "Amasya", "Adana"]
    var famous = ["Simit", "Tokat Kebabı", "Boyoz", "Çörek", "Muzlu Süt"]
    var images = ["kayisi","cag-kebap","etli-ekmek","lokum","sut-helvasi"]
    */
    
    var myCities = [City]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        myCities.append(City(name: "Ankara", famus: "Simit", image: "kayisi"))
        myCities.append(City(name: "Tokat", famus: "Tokat Kebabı", image: "cag-kebap"))
        myCities.append(City(name: "İzmir", famus: "Boyoz", image: "etli-ekmek"))
        myCities.append(City(name: "Amasya", famus: "Çörek", image: "lokum"))
        myCities.append(City(name: "Adana", famus: "Muzlu Süt", image: "sut-helvasi"))
        
        tableView.register(UINib(nibName: "CityCell", bundle: nil), forCellReuseIdentifier: "cityCell")
    }

}

extension TableViewController: UITableViewDataSource, UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myCities.count
    }
    
    //Kingfisher, SDWebimage, AlamofireImage
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! CityCell
        
        /*cell.textLabel?.text = myCities[indexPath.row].name
        cell.detailTextLabel?.text = myCities[indexPath.row].famus
        cell.imageView?.image = UIImage(named: myCities[indexPath.row].image)
         */
        cell.setup(model: myCities[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected: \(myCities[indexPath.row].name ?? "")")
        
        let alertController = UIAlertController(title: "\(myCities[indexPath.row].name ?? "")", message: "\(myCities[indexPath.row].famus ?? "")", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}
