//
//  ReservationViewController.swift
//  Storage
//
//  Created by Kerim Çağlar on 30.03.2024.
//

import UIKit

class ReservationViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "ReservationInsertCell", bundle: nil), forCellReuseIdentifier: "reservationCell")
        //TODO ??
    }

}

extension ReservationViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reservationCell", for: indexPath) as! ReservationInsertCell
        
        cell.delegate = self
        
        return cell
    }
    
}

extension ReservationViewController: ReservationInsertCellDelegate {
    func reloadTable() {
        tableView.reloadData()
    }
}
