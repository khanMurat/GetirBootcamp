//
//  ListenerViewController.swift
//  Getir-Basic-Components
//
//  Created by Kerim Çağlar on 23.03.2024.
//

import UIKit

class ListenerViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func getDataButton(_ sender: Any) {
        
        let senderVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SenderViewController") as! SenderViewController
        
        senderVC.delegate = self
        
//        senderVC.nextMessage = { message in
//                                                  // pass data with closure
//            self.messageLabel.text = message
//        }
        
        present(senderVC, animated: true)
    }
}

extension ListenerViewController: MessageDelegate {
    func sendMessage(text: String) {
        messageLabel.text = text
    }
}
