//
//  ReservationInsertCell.swift
//  Storage
//
//  Created by Kerim Çağlar on 30.03.2024.
//

import UIKit

protocol ReservationInsertCellDelegate {
    func reloadTable()
}

class ReservationInsertCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView! {
        didSet {
            cardView.layer.borderWidth = 1
            cardView.layer.borderColor = UIColor(red: 0.09, green: 0.81, blue: 0.77, alpha: 1).cgColor
            cardView.layer.cornerRadius = 6
            
        }
    }
    
    @IBOutlet weak var reservationHeaderStackView: UIStackView!
    @IBOutlet weak var reservationNumberStackView: UIStackView!
    @IBOutlet weak var reservationConfirmationStackView: UIStackView!
    
    @IBOutlet weak var reservationExpandListLabel: UILabel!
    @IBOutlet weak var reservationNumberTextField: UITextField!
    
    @IBOutlet weak var digit1: UITextField!
    @IBOutlet weak var digit2: UITextField!
    @IBOutlet weak var digit3: UITextField!
    @IBOutlet weak var digit4: UITextField!
    @IBOutlet weak var digit5: UITextField!
    @IBOutlet weak var digit6: UITextField!
    
    var delegate: ReservationInsertCellDelegate?
    
    private func configure() {
        reservationExpandListLabel.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(expand))
        reservationExpandListLabel.addGestureRecognizer(tap)
    }
    
    @objc private func expand() {
        reservationNumberStackView.isHidden = !reservationNumberStackView.isHidden
        reservationConfirmationStackView.isHidden = true
        
        if self.reservationNumberStackView.isHidden {
            reservationExpandListLabel.text = "+ Rezervasyonumu listeme Ekle"
        } else {
            reservationExpandListLabel.text = "- Rezervasyonumu listeme Ekle"
        }
        
        delegate?.reloadTable()
    }
    
    private func configureReservationNumberTF() {
        
        let rightStackView = UIStackView()
        rightStackView.axis = .horizontal
        
        let emptyView = UIView()
        emptyView.backgroundColor = .clear
        emptyView.widthAnchor.constraint(equalToConstant: 4).isActive = true
        
        let button = UIButton(type: .custom)
        button.heightAnchor.constraint(equalToConstant: 46).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.layer.cornerRadius = 6
        button.backgroundColor = .systemBlue
        button.setTitle("SORGULA", for: .normal)
        button.addTarget(self, action: #selector(getConfirmCode), for: .touchUpInside)
        
        rightStackView.addArrangedSubview(button)
        rightStackView.addArrangedSubview(emptyView)
        
        reservationNumberTextField.rightViewMode = .always
        reservationNumberTextField.rightView = rightStackView
        
    }
    
    @objc private func getConfirmCode() {
        digit1.becomeFirstResponder()
        reservationConfirmationStackView.isHidden = false
        delegate?.reloadTable()
    }
    
    private func configuteOTP() {
        digit1.delegate = self
        digit2.delegate = self
        digit3.delegate = self
        digit4.delegate = self
        digit5.delegate = self
        digit6.delegate = self
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configure()
        configureReservationNumberTF()
        configuteOTP()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ReservationInsertCell: UITextFieldDelegate {
    
    private func hello() {
        print("Beni çalıştırdııı")
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let text = textField.text
        
        if text?.utf8.count == 1 {
            switch textField {
            case digit1:
                digit2.becomeFirstResponder()
            case digit2:
                digit3.becomeFirstResponder()
            case digit3:
                digit4.becomeFirstResponder()
            case digit4:
                digit5.becomeFirstResponder()
            case digit5:
                digit6.becomeFirstResponder()
            case digit6:
                hello()
                digit6.resignFirstResponder()
                
            default:
                break
            }
        }
    }
    
}

//Tuist
