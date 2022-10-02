//
//  CoreDataManager.swift
//  CountriesRework
//
//  Created by Erdem Papakçı on 2.10.2022.
//

import UIKit
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    var checkButtonInstance = CustomButton()
    var checkBarButtonInstance = CustomBarButton()
    
    func checkData(code: String){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CountryDatas")
        fetchRequest.predicate = NSPredicate(format: "code == %@", code)
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let numberOfRecords = try context.count(for: fetchRequest)
            if numberOfRecords > 0 {
                CustomButton.checkButton = true
                CustomBarButton.checkBarButton = true
                
            } else {
                CustomButton.checkButton = false
                CustomBarButton.checkBarButton = false
            
            }
        } catch {
            print("ERROR checking")
        }
    }
    
    func saveData(name: String, code: String) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let saveData = NSEntityDescription.insertNewObject(forEntityName: "CountryDatas", into: context)
        saveData.setValue(name, forKey: "name")
        saveData.setValue(code, forKey: "code")
        do {
            try context.save()
        } catch {
            print("error saving")
        }
    }
 
    
}
