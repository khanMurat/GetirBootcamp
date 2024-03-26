//
//  NotificationSenderVC.swift
//  Getir-Basic-Components
//
//  Created by Kerim Çağlar on 23.03.2024.
//

import UIKit

class NotificationSenderVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendNotification(_ sender: UIButton) {
        NotificationCenter.default.post(name: .sendDataNotification, object: nil)
        dismiss(animated: true)
    }
    
}
