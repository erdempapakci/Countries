//
//  ViewModel.swift
//  CountriesRework
//
//  Created by Erdem Papakçı on 29.09.2022.
//

import Foundation
import RxCocoa
import RxSwift

class HomeViewModel {
    
    var countries = BehaviorSubject(value: [CountryList]())
    
     func fetchCountries() {
          
           NetworkManager.shared.fetchCountryList { result in
               switch result {
               case .success(let countries):
                   
                   self.countries.on(.next(countries.data))
               case .failure(let error):
                   print("\(error): error")
               }
           }
       }
   
}
