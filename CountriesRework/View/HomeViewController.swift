//
//  HomeViewController.swift
//  CountriesRework
//
//  Created by Erdem Papakçı on 27.09.2022.
//

import UIKit
import RxSwift
import RxCocoa

final class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeTableView: UITableView!
    
    private var homeViewModel = HomeViewModel()
    private var bag = DisposeBag()
    var code = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        binding()
        
    }
    func registerCell() {
        self.homeTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
    }
    
    func binding() {
        
        self.homeViewModel.fetchCountries()
        homeTableView.rx.setDelegate(self).disposed(by: bag)
        homeViewModel.countries.bind(to: homeTableView.rx.items(cellIdentifier: "TableViewCell", cellType: TableViewCell.self)) { (row,item,cell) in
            cell.countryName.text = item.name
            cell.code = item.code
            cell.codeLabel.text = item.code
            
            self.homeViewModel.fetchCountries()
            
        }.disposed(by: bag)
        
        homeTableView.rx.modelSelected(CountryList.self)
            .subscribe { countryList in
                let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                detailVC.code = countryList.code
                self.navigationController?.pushViewController(detailVC, animated: true)
            }.disposed(by: bag)
        
    }
    
}
extension HomeViewController: UITableViewDelegate {}
