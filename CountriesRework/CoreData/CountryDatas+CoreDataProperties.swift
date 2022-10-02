//
//  CountryDatas+CoreDataProperties.swift
//  
//
//  Created by Erdem Papakçı on 1.10.2022.
//
//

import Foundation
import CoreData


extension CountryDatas {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CountryDatas> {
        return NSFetchRequest<CountryDatas>(entityName: "CountryDatas")
    }

    @NSManaged public var code: String?
    @NSManaged public var name: String?

}
