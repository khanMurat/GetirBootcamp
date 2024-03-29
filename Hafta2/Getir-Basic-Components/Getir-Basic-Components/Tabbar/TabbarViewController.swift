//
//  TabbarViewController.swift
//  Getir-Basic-Components
//
//  Created by Kerim Çağlar on 24.03.2024.
//

import UIKit

class TabbarViewController: UIViewController {
    
    var middleButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        guard let tabbar = tabBarController?.tabBar else { return }
        tabbar.backgroundColor = .blue
        tabbar.tintColor = .yellow
        tabbar.unselectedItemTintColor = .red
        
        tabbar.layer.cornerRadius = 30
        tabbar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabbar.layer.masksToBounds = true // bu ne işe yarar
        //Mask to bound ile clip to fark nedir
        
        // Bir görünümün (UIView) alt görünümlerinin (subviews) görünümün sınırlarının dışına çıkmasını engeller.
        // masksToBounds bir CALayer özelliğidir ve düşük seviyeli çizim ve animasyonlar için kullanılır. clipsToBounds ise bir UIView özelliğidir ve genellikle yüksek seviyeli arayüz düzenlemelerinde kullanılır.
        
        tabbar.layer.borderWidth = 2
        tabbar.layer.borderColor = UIColor.black.cgColor
        
        //orta buton hafif önde olacak şekilde nasıl yapılıyor örnek yapınız.
        
        setupMiddleButton()
        
        // itemlar çok altta normalde daha yukarda durmaz mı? Bunu nasıl yapıyoruz
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -10)
    }
    
    func setupMiddleButton() {
        
        middleButton = UIButton(frame: CGRect(x: (self.view.bounds.width / 2)-25, y: 0, width: 50, height: 50))

        middleButton.backgroundColor = .gray
        middleButton.layer.cornerRadius = middleButton.frame.height / 2
        middleButton.layer.masksToBounds = true
        middleButton.setImage(UIImage(systemName: "plus")!.withTintColor(.red), for: .normal)
        middleButton.addTarget(self, action: #selector(middleButtonAction), for: .touchUpInside)

        guard let tabBar = self.tabBarController?.tabBar else { return }
        tabBar.addSubview(middleButton)
    }
    
    @objc private func middleButtonAction() {
        
        print("Middle Button Pressed")
    }
}
