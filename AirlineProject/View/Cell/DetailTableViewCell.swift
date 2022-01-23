//
//  DetailTableViewCell.swift
//  AirlineProject
//
//  Created by Fatemeh Ghanavati  on 22/01/2022.
//

import UIKit
import SDWebImage

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var airlineLogo: UIImageView!
    @IBOutlet weak var airlineName: UILabel!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var dateOfStablished: UILabel!
    @IBOutlet weak var sloganTitle: UILabel!
    @IBOutlet weak var websiteLink: UITextView!
    
    var details: PassengerDetail!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        airlineLogo.layer.cornerRadius = 40
        airlineLogo.layer.borderWidth = 1
        airlineLogo.layer.borderColor = UIColor.systemGray5.cgColor
        self.selectionStyle = .none
        websiteLink.isEditable = false
        websiteLink.dataDetectorTypes = UIDataDetectorTypes.all
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillDetailViews() {
        airlineLogo.sd_setImage(with: URL(string: details.airlineLogo ?? ""))
        airlineName.text = details.airlineName
        countryName.text = details.country
        dateOfStablished.text = details.establishedDate
        sloganTitle.text = details.website
        websiteLink.text = details.slogan
    
    }
    
}
