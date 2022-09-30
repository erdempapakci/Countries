//
//  DetailViewController.swift
//  CountriesRework
//
//  Created by Erdem Papakçı on 27.09.2022.
//

import UIKit
import RxSwift

class DetailViewController: UIViewController {
    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var countryCode: UILabel!
   
     var detailViewModel = DetailViewModel()
    
    @IBOutlet weak var imageView: UILabel!
    private var bag = DisposeBag()
    var code = String()
    var countryDetail = CountryDetail?.self
    @IBOutlet weak var wikiDataId: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        setUI()
        countryCode.text = code
       // fetchCountryDetail(code: code)
        
    }

    func setUI() {
        detailViewModel.fetchCountries(code: code)
      detailViewModel.detailsBehavior.subscribe(onNext:{ detail in
          self.wikiDataId.text = detail.wikiDataID
          self.imageView.text = detail.flagImageURI
          
        }).disposed(by: bag)
        
       
    }
    /*
    func binding(code:String) {
       
        
        
        detailViewModel.fetchCountryDetails(code: code)
        
        do {
            wikiDataId.text = try detailViewModel.countryDetails.value().wikiDataID
            
        } catch {
            print("fetching error")
        }
        
        
      
            
        
    }
    func fetchCountryDetail(code: String) {
      
        NetworkManager.shared.fetchCountryDetails(code: code) { details in
            
            switch details {
            case .success(let detail):
                self.wikiDataId.text = detail.data.wikiDataID
                
                
            case .failure(let error):
                print(error)
            }
            
        }
      }
    
    */
}
