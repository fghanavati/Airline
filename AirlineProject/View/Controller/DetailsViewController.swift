//
//  DetailsViewController.swift
//  AirlineProject
//
//  Created by Fatemeh Ghanavati  on 21/01/2022.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController {

    
    @IBOutlet weak var detailsTableView: UITableView!
    let detailsTableViewIdentifier = "DetailTableViewCell"
    var details: PassengerDetail!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
    }
    
    private func setupTableView() {
        detailsTableView.register(UINib(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: detailsTableViewIdentifier)
    }
    
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: detailsTableViewIdentifier, for: indexPath) as? DetailTableViewCell {
            cell.websiteLink?.text = details.website
            cell.countryName?.text = details.country
            cell.airlineName?.text = details.airlineName
            cell.sloganTitle?.text = details.slogan
            cell.dateOfStablished?.text = details.establishedDate
            cell.airlineLogo.sd_setImage(with: URL(string: details.airlineLogo ?? ""))
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height
    }
}
