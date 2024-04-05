//
//  CookCreateViewController.swift
//  Storage
//
//  Created by Kerim Çağlar on 30.03.2024.
//

import UIKit
import CoreData

class CookCreateViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cookNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        imageView.addGestureRecognizer(tap)
    }
    
    @objc func chooseImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        dismiss(animated: true)
    }

    @IBAction func cookSaveAction(_ sender: UIButton) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let newCook = NSEntityDescription.insertNewObject(forEntityName: "Cooks", into: context)
        newCook.setValue(cookNameTextField.text, forKey: "name")
        let imageData = imageView.image?.jpegData(compressionQuality: 0.5)
        newCook.setValue(imageData, forKey: "image")
        
        do {
            try context.save()
        } catch {
            print("Veri kaydedilemedi")
        }
        
        //dismiss(animated: true)
        navigationController?.popViewController(animated: true)
    }
    
}
