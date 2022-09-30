//
//  SavedViewController.swift
//  CountriesRework
//
//  Created by Erdem Papakçı on 28.09.2022.
//

import UIKit

class SavedViewController: UIViewController {

    @IBOutlet weak var savedTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        savedTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
 

}

extension SavedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = savedTableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.countryName.text = "dede"
        
        return cell
    }
    
}
