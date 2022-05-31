//
//  Bundle+Ext.swift
//  Laender-App
//
//  Created by Karolina Sulik on 18.05.22.
//

import Foundation

extension Bundle {
    /// Diese Methode kann für das Laden einer JSON-Datei aus dem lokalen Bundle verwendet werden.
    ///
    /// Description
    /// - Parameter fileName: Der Dateiname der JSON-Datei, die dekodiert werden soll. **Wichtig**: Die Endung .json muss mit angegeben werden<##>
    ///
    ///
    /// ```
    /// let countries: [Country] = Bundle.main.decode("countries.json")//Beispiel
    /// ```
    /// - Returns: Gibt die dekodierten JSON-Daten in dem angegebenen Swift-Datentyp zurück.
    func decode<T: Decodable>(fileName: String, a: Int? = nil) -> T {
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
