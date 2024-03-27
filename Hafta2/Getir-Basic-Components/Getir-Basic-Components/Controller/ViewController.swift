//
//  ViewController.swift
//  Getir-Basic-Components
//
//  Created by Kerim Çağlar on 23.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    //MARK: UIViewController yaşam döngüsünü araştırınız, methodların kulanım senaryoları için birer örnek yazınız. (loadView gibi methodlarıda araştırınız)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Merhaba uygulama ayağa kalktı")
        
        /*let frame = CGRect(x: 0, y: 0, width: 300, height: 500)
        let label = UILabel(frame: frame)
        label.backgroundColor = .red
        label.text = "Getir Bootcampe hoş geldiniz!"
        //label.textColor = .white
        label.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        //label.font = UIFont(name: "Avenir", size: 20)
        label.font = .boldSystemFont(ofSize: 25)
        label.numberOfLines = 0
        label.isUserInteractionEnabled = true
        view.addSubview(label)*/
        
        saveButton.setTitle("SAVE", for: .normal)
        saveButton.setTitleColor(.gray, for: .normal)
        
    }
    
    @IBAction func saveAction(_ sender: Any) {
        guard let message = messageTextField.text, !message.isEmpty else { return }
        messageLabel.text = message
        messageTextField.text = ""
    }
    


}

