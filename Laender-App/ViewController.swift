//
//  ViewController.swift
//  Laender-App
//
//  Created by Karolina Sulik on 27.04.22.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlet
    @IBOutlet weak var tableView: UITableView!
    
    
    let data = ["Deutschland", "Griechenland", "Frankreich", "Dänemark"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        tableView.rowHeight = 75
        
    }


}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CountryTableViewCell
        
        
        cell.countryNameLabel.text = data[indexPath.row]
        
        return cell

    }
    
    
}

