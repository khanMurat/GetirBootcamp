//
//  DetailTableViewCell.swift
//  HWSearch
//
//  Created by Murat on 19.03.2024.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var descpLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
    }

}
