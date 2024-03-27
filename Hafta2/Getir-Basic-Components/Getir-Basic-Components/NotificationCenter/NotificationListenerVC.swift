//
//  NotificationListenerVC.swift
//  Getir-Basic-Components
//
//  Created by Kerim Çağlar on 23.03.2024.
//

import UIKit

class NotificationListenerVC: UIViewController {

    @IBOutlet weak var messageImageView: UIImageView!
    
    var images = ["lokum", "sut-helvasi", "cag-kebap", "kayisi", "etli-ekmek"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let notificationCenter: NotificationCenter = .default
        notificationCenter.addObserver(self, selector: #selector(changeImage), name: .sendDataNotification, object: nil)
    }

    @objc func changeImage() {
        messageImageView.image = UIImage(named: images.randomElement() ?? "lokum")
    }

}

// MARK: Notification center ile add absorver sonrası memory leak oluşmaması için ne yapılmalı?
// Exercism 10 tane daha seviye isteğe bağlı
// Euler project 6,7
// Closure ile veri taşıma var callback: ((String) -> Void)?   vc.callback = { text in .... }
