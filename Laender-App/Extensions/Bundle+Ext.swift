//
//  Bundle+Ext.swift
//  Laender-App
//
//  Created by Karolina Sulik on 18.05.22.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(fileName: String) -> T {
        guard let url = self.url(forResource: fileName, withExtension: nil) else {
            fatalError("Datei konnte im Bundle nicht gefunden werden.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Datei konnte nicht geladen werden.")
        }
        
        guard let objects = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("Dekodierung ist schiefgelaufen")
        }
        
        return objects
    }
}
