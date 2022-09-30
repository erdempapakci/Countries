//
//  ViewModel.swift
//  CountriesRework
//
//  Created by Erdem Papakçı on 29.09.2022.
//

import Foundation
import RxSwift
import RxCocoa


class DetailViewModel {
   
    private let networkManager = NetworkManager()
   // var countryDetails = BehaviorSubject<CountryDetail>(value: CountryDetail(code: "", flagImageURI: "", name: "", wikiDataID: ""))
    
    let bag = DisposeBag()
    
    var detailsBehavior = PublishSubject<CountryDetail>()
    
    func fetchCountries(code: String) {
         
        networkManager.fetchCountryDetails(code: code) { countrydetail in
            switch countrydetail {
            case .success(let detail):
                self.detailsBehavior.onNext(detail.data)
            case .failure(let error):
                print(error.localizedDescription)
            }
           
        }
      }
    
    
    
    
    
    /*
    func fetchCountryDetails(code: String) {
      
        networkManager.fetchCountryDetails(code: code) { details in
            
            switch details {
            case .success(let detail):
                self.countryDetails.onNext(detail.data)
                
                
            case .failure(let error):
                print(error)
            }
            
        }
      }
    */

    
    
    
}
