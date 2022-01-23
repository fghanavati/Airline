//
//  HomeViewController.swift
//  AirlineProject
//
//  Created by Fatemeh Ghanavati  on 21/01/2022.
//

import UIKit


class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeTableView: UITableView!
    let passengerTableViewIdentifier = "passengerTableViewIdentifier"
    var viewModel: PassengersViewModel!
    var passengerList = [UserData]()
    var isLoadingList = false
    var totalPassengers = 0
    var totalPages = 0
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel = PassengersViewModel()
        getPassengers(page: currentPage)
    }
    
    private func setupTableView() {
        homeTableView.register(UINib(nibName: "PassengerTableViewCell", bundle: nil), forCellReuseIdentifier: passengerTableViewIdentifier)
    }
    
    private func getPassengers(page: Int) {
        isLoadingList = true
        viewModel.getPassengers(currentPage: page) { response, error in
            if error == nil {
                self.isLoadingList = false
                if let response = response , let data = response.data, let totalPages = response.totalPages, let totalPassengers = response.totalPassengers {
                    self.totalPages = totalPages
                    self.totalPassengers = totalPassengers
                    self.passengerList += data
                    self.homeTableView.reloadData()
                }
            } else {
                self.isLoadingList = false
                print("Error")
            }
        }
    }
    
    
    @IBAction func addNewPassengerButton(_ sender: Any) {
        let SB = UIStoryboard(name: "Main", bundle: nil)
        if let vc = SB.instantiateViewController(withIdentifier: "CreatePassengerViewController") as? CreatePassengerViewController {
            vc.delegate = self
            present(vc, animated: true, completion: nil)
        }
    }
}

extension HomeViewController: NewUserCreated {
    func userCreated(passenger: UserData) {
        passengerList.insert(passenger, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        homeTableView.insertRows(at: [indexPath], with: .left)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passengerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: passengerTableViewIdentifier, for: indexPath) as? PassengerTableViewCell {
            cell.passengerName?.text = passengerList[indexPath.row].name
            cell.tripsNumber?.text = "\(passengerList[indexPath.row].trips)"
            cell.airlineLogo.sd_setImage(with: URL(string: passengerList[indexPath.row].airline?.first?.logo ?? ""))
            cell.accessoryType = .disclosureIndicator
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 78
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height ) && !isLoadingList){
            isLoadingList = true
            if passengerList.count < totalPassengers && currentPage < totalPages {
                currentPage += 1
                getPassengers(page: currentPage)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let vc = sb.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController {
            if let airlines = passengerList[indexPath.row].airline, let airline = airlines.first {
                vc.details = PassengerDetail(airlineLogo: airline.logo, airlineName: airline.name, country: airline.country, establishedDate: airline.established, website: airline.website, slogan: airline.slogan)
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
