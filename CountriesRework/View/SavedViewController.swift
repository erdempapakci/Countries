//
//  SavedViewController.swift
//  CountriesRework
//
//  Created by Erdem Papakçı on 28.09.2022.
//

import UIKit
import CoreData

final class SavedViewController: UIViewController {
    
    @IBOutlet weak var savedTableView: UITableView!
    
    private var nameArray = [String]()
    private var codeArray = [String]()
    private var chosenCode = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getSavedList()
        
    }
    
    func register() {
        savedTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
    }
    func getSavedList(){
        nameArray.removeAll(keepingCapacity: false)
        codeArray.removeAll(keepingCapacity: false)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CountryDatas")
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject] {
                if let name = result.value(forKey : "name") as? String {
                    self.nameArray.append(name)
                    
                }
                if let code = result.value(forKey : "code") as? String {
                    self.codeArray.append(code)
                }
                
                self.savedTableView.reloadData()
            }
        } catch {
            
        }
    }
    
}

extension SavedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = savedTableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.codeLabel.text = codeArray[indexPath.row]
        cell.countryName.text = nameArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenCode = codeArray[indexPath.row]
        performSegue(withIdentifier: "toDetailsFromSaved", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsFromSaved" {
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.code = chosenCode
            
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CountryDatas")
            let nameString = nameArray[indexPath.row]
            let codeString = codeArray[indexPath.row]
            
            fetchRequest.predicate = NSPredicate(format: "name = %@ ", nameString)
            fetchRequest.predicate = NSPredicate(format: "code = %@ ", codeString)
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(fetchRequest)
                if results.count > 0 {
                    
                    for result in results as! [NSManagedObject] {
                        
                        if let name = result.value(forKey: "name") as? String {
                            
                            if name == nameArray[indexPath.row] {
                                context.delete(result)
                                nameArray.remove(at: indexPath.row)
                                if let code = result.value(forKey: "code") as? String{
                                    if code == codeArray[indexPath.row]{
                                        context.delete(result)
                                        codeArray.remove(at: indexPath.row)
                                    }
                                }
                                self.savedTableView.reloadData()
                                
                                do {
                                    try context.save()
                                    
                                } catch {
                                    print("error")
                                }
                                
                                break
                            }
                        }
                    }
                }
            } catch {
                print("error")
            }
        }
    }
    
}
