//
//  TableViewCell.swift
//  CountriesRework
//
//  Created by Erdem Papakçı on 27.09.2022.
//

import UIKit
import CoreData

final class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var starButton: CustomButton!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    
    private var coreDataManager = CoreDataManager()
    var code = String()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: "TableViewCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func favButtonClck(_ sender: Any) {
       
        CoreDataManager.shared.saveData(name: countryName.text!, code: codeLabel.text!)
    
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
        isSavedOnButton(name: countryName.text!)
        starButton.checkSaved()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        isSavedOnButton(name: countryName.text!)
        starButton.checkSaved()
        
    }
    
    func isSavedOnButton(name:String) {
        CoreDataManager.shared.checkData(code: self.codeLabel.text!)
        
    }
}

