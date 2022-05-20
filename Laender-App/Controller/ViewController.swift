//
//  ViewController.swift
//  Laender-App
//
//  Created by Karolina Sulik on 27.04.22.
//

import UIKit

class ViewController: UIViewController {

    
    //lazy bedeutet dass es erst dann initzializiert wird, wenn erst countries Konstante initializiert wurde
    lazy var filteredCountries = countries
    let countries: [CountryModel] = Bundle.main.decode(fileName: "data.json")
    var selectedCountry: CountryModel?
    
    
    //MARK: - Outlet
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        tableView.keyboardDismissMode = .onDrag
        tableView.rowHeight = 100
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let zielTVC = segue.destination as? CountryDetailTableVC,
           segue.identifier == "showDetail" {
            zielTVC.country = selectedCountry
        }
    }

}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedCountry = filteredCountries[indexPath.row]
        performSegue(withIdentifier: "showDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCountries.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CountryTableViewCell
        
        
        cell.countryNameLabel.text = filteredCountries[indexPath.row].countryName
        cell.countryFlagImage.image = UIImage(named: filteredCountries[indexPath.row].imageName)
        return cell

    }
    
    
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let searchText = searchText.lowercased()
        if searchText != "" {
            filteredCountries = countries.filter({ country in
                if country.countryName.lowercased().contains(searchText) {
                    return true
                }
                return false
            })
        } else {
            filteredCountries = countries
        }
        
        self.tableView.reloadData()
        
        //print(filteredCountries)
    }
}
