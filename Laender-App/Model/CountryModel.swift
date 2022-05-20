//
//  CountryModel.swift
//  Laender-App
//
//  Created by Karolina Sulik on 04.05.22.
//

import Foundation


struct CountryModel : Decodable {
    var countryName : String
    var inhabitants : String
    var capital : String
    var currency : String
    var imageName : String
    
}
