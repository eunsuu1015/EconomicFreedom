//
//  ResultTableViewCell.swift
//  EconomicFreedom
//
//  Created by Authlabs on 2022/07/04.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var labelMoney: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


