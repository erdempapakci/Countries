//
//  CountryDetail.swift
//  CountriesRework
//
//  Created by Erdem Papakçı on 28.09.2022.
//

import Foundation


struct CountryDetailMain: Codable {
   
    let data: CountryDetail
    
}

struct CountryDetail: Codable {
  
    let code : String
    let flagImageURI: String
    let name: String
    let wikiDataID: String

    enum CodingKeys: String, CodingKey {
        case code
        case flagImageURI = "flagImageUri"
        case name
        case wikiDataID = "wikiDataId"
    }
}
