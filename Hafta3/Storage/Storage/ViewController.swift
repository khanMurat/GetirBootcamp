//
//  ViewController.swift
//  Storage
//
//  Created by Kerim Çağlar on 30.03.2024.
//

import UIKit
import KeychainAccess

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageTextField: UITextField!
    
    let keychain = Keychain(service: "com.getirbootcamp.storage")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //let message = UserDefaults.standard.value(forKey: "message") as? String
        let message = keychain["message"]
        messageLabel.text = message
    }

    // User Defaults plain text olarak veri kaydeder. (Onemsiz veri tutulmalı)
    // pentest
    @IBAction func saveMessage(_ sender: UIButton) {
        
        let message = messageTextField.text
        
        /*DispatchQueue.main.async {
            UserDefaults.standard.setValue(message, forKey: "message")
        }*/
        
        keychain["message"] = message
        
        messageLabel.text = message
        messageTextField.text = ""
    }
    
}

/**

 Stage(Tamamen test verisi) - Preprod(Canlıdaki verilerin clone) - Prod (Canlıdaki veri)
 1.0.1
 1.0.0
 Master -> Canlıya çıkmış kodun 5 gün boyunca bir sorun olmadığı gözlemlendikten sonraki hali
 Develop/aaaa
 Feature/zzzz
 Bugfix/yyyyy
 Hotfix/xxxxx

 */
