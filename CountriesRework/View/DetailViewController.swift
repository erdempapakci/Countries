//
//  DetailViewController.swift
//  CountriesRework
//
//  Created by Erdem Papakçı on 27.09.2022.
//

import UIKit
import RxSwift
import CoreData

final class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var countryCode: UILabel!
    @IBOutlet weak var countryTitle: UILabel!
    @IBOutlet weak var favButton: CustomBarButton!
    
    lazy var saved = Bool()
    private var bag = DisposeBag()
    var code = String()
    
    private var wikidataID = String()
    private var detailViewModel = DetailViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryCode.text = code
        setUI()
         
    }
    override func viewWillAppear(_ animated: Bool) {
        isSavedOnButton(name: countryTitle.text!)
        favButton.checkSaved()
        
    }
    
    @IBAction func detailButtonClicked(_ sender: Any) {
        self.detailViewModel.changeImage(url: wikidataID)
        
    }

    @IBAction func favButtonClicked(_ sender: Any) {
        saveDataToCore()
        
    }
    
    private func setUI() {
        detailViewModel.fetchCountries(code: code)
        detailViewModel.detailsBehavior.subscribe(onNext:{ detail in
            self.countryTitle.text = detail.name
            let svg = URL(string: detail.flagImageURI)!
            
            self.detailImageView.downloadedsvg(from: svg)
            self.wikidataID = detail.wikiDataID
            
        }).disposed(by: bag)
    }
}

extension DetailViewController {
    // CORE DATA FUNCS
    
    private func isSavedOnButton(name:String) {
        CoreDataManager.shared.checkData(code: self.code)
       
    }
    
    private func saveDataToCore() {
        
        CoreDataManager.shared.saveData(name: countryTitle.text!, code: countryCode.text!)
        
    }
 
    
}
