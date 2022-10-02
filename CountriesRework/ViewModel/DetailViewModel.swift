//
//  ViewModel.swift
//  CountriesRework
//
//  Created by Erdem Papakçı on 29.09.2022.
//

import Foundation
import RxSwift
import RxCocoa


final class DetailViewModel {
    
    private let networkManager = NetworkManager()
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
    
    func changeImage(url: String)  {
        let urlString = "https://www.wikidata.org/wiki/\(url )"
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, completionHandler: nil)
        }
        
    }
    
}
