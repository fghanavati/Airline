//
//  PassengerTableViewCell.swift
//  AirlineProject
//
//  Created by Fatemeh Ghanavati  on 21/01/2022.
//

import UIKit

class PassengerTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var passengerName: UILabel!
    @IBOutlet weak var tripsNumber: UILabel!
    @IBOutlet weak var airlineLogo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        airlineLogo.layer.cornerRadius = 30
        airlineLogo.layer.borderWidth = 1
        airlineLogo.layer.borderColor = UIColor.systemGray4.cgColor
        self.selectionStyle = .none
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
