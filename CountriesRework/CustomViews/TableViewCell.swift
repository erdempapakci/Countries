//
//  TableViewCell.swift
//  CountriesRework
//
//  Created by Erdem Papakçı on 27.09.2022.
//

import UIKit

@IBDesignable
class TableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var countryName: UILabel!
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: "TableViewCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
    }
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
 
    
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
   
    }
  
   
}

