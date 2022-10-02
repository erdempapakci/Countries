//
//  CustomButton.swift
//  CountriesRework
//
//  Created by Erdem Papakçı on 2.10.2022.
//

import UIKit

class CustomButton: UIButton {
    
    static var checkButton = Bool()
    
    func checkSaved() {
        
        if CustomButton.checkButton == true {
            self.setImage(UIImage(systemName: "star.fill"), for: .normal)
            
        } else {
            self.setImage(UIImage(systemName: "star"), for: .normal)
        }
        
    }
    override  func awakeFromNib() {
        self.isUserInteractionEnabled = true
    }
}
class CustomBarButton: UIBarButtonItem {
    static var checkBarButton = Bool()
    
    func checkSaved(){
        
        if CustomBarButton.checkBarButton == true {
            self.image = UIImage(systemName: "star.fill")
            
        } else {
            self.image = UIImage(systemName: "star")
        }
    }
}
