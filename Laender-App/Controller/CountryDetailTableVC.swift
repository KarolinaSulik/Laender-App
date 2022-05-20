//
//  CountryDetailTableVC.swift
//  Laender-App
//
//  Created by Karolina Sulik on 28.04.22.
//

import UIKit

class CountryDetailTableVC: UITableViewController {

    //MARK: - Outlets
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryFlagImage: UIImageView!
    @IBOutlet weak var countryInhabitants: UILabel!
    @IBOutlet weak var countryCurrency: UILabel!
    @IBOutlet weak var countryCapital: UILabel!
    
    
    var country: CountryModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryNameLabel.text = country?.countryName
        countryFlagImage.image = UIImage(named: country?.imageName ?? "DefaultImage")
        countryFlagImage.layer.borderWidth = 2
        countryInhabitants.text = country?.inhabitants
        countryCapital.text = country?.capital
        countryCurrency.text = country?.currency
        
    }
    
    
    
    
}
