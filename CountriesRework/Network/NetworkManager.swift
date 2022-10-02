//
//  APICaller.swift
//  CountriesRework
//
//  Created by Erdem Papakçı on 27.09.2022.
//

import Foundation
import RxSwift
import RxCocoa

struct NetworkManager {
    
    static let shared = NetworkManager()
    static let apiKey = "75f022546bmsh2ab473fa3a242e1p132949jsn7bc42c64069c"
    static let apiHost = "wft-geo-db.p.rapidapi.com"
    static let apiRequest = "https://wft-geo-db.p.rapidapi.com/v1/geo/countries"
    
    let headers = [
        "X-RapidAPI-Key": "\(NetworkManager.apiKey)"  ,
        "X-RapidAPI-Host": "\(NetworkManager.apiHost)"
    ]
    
    func fetchCountryList(completion: @escaping(Result<CountryListMain,Error>) -> Void) {
        
        var request = URLRequest(url: URL(string: NetworkManager.apiRequest + "?limit=10")!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else {return}
            DispatchQueue.main.async {
                do {
                    let countries = try JSONDecoder().decode(CountryListMain.self, from: data)
                    completion(.success(countries))
                    
                    print("countries")
                } catch {
                    print("NetworkError.DataError")
                    
                }
            }
            
        }
        .resume()
    }
    
    func fetchCountryDetails(code: String, completion: @escaping(Result<CountryDetailMain,Error>) -> Void) {
        
        var request = URLRequest(url: URL(string: NetworkManager.apiRequest + "/\(code)")!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else {return}
            DispatchQueue.main.async {
                do {
                    let countryDetails = try JSONDecoder().decode(CountryDetailMain.self, from: data)
                    completion(.success(countryDetails))
                    
                    print("countries")
                } catch {
                    print("NetworkError.DataError")
                    
                }
            }
        }
        .resume()
        
    }
}
