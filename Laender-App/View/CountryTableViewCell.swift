//
//  CountryTableViewCell.swift
//  Laender-App
//
//  Created by Karolina Sulik on 28.04.22.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var countryNameLabel: UILabel!
   
    
    @IBOutlet weak var countryFlagImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        countryFlagImage.layer.borderWidth = 1.5
        countryFlagImage.layer.cornerRadius = countryFlagImage.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
