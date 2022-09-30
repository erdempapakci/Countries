//
//  CountryList.swift
//  CountriesRework
//
//  Created by Erdem Papakçı on 28.09.2022.
//

import Foundation


struct CountryListMain: Codable {
    let data: [CountryList]
  
}

struct CountryList: Codable {
    let code: String
   
    let name, wikiDataID: String

    enum CodingKeys: String, CodingKey {
        case code,name
        case wikiDataID = "wikiDataId"
    }
}

