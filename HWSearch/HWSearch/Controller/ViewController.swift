//
//  ViewController.swift
//  HWSearch
//
//  Created by Murat on 18.03.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIService.fetchData(word: "job") { result in
            
            switch result {
            case .success(let definition):
                print(definition.first?.phonetic)
            case .failure(let error):
                print(error.title)
            }
        }
    }
}

