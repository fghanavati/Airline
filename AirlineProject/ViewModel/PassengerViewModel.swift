//
//  PassengerViewMode.swift
//  AirlineProject
//
//  Created by Fatemeh Ghanavati  on 21/01/2022.
//

import Foundation
import Alamofire

typealias PassengerInformation = (Passengers?, ErrorModel?) -> Void
protocol PassengerInformationProtocol {
    
    func getPassengers(currentPage: Int, completion: @escaping PassengerInformation)
}

class PassengersViewModel {
    let service = NetworkingManager()
}


extension PassengersViewModel: PassengerInformationProtocol {
    func getPassengers(currentPage: Int, completion: @escaping PassengerInformation) {
        service.getRequest(url: URLs.passenger.description) { data, error in
            if error == nil {
                do {
                    if let data = data {
                        let decoded = try JSONDecoder().decode(Passengers.self, from: data)
                        completion(decoded, nil)
                    }
                } catch {
                    completion(nil, ErrorModel(title: Errors.errorTitle.description, message: Errors.failedJson.description))
                }
            } else {
                completion(nil, ErrorModel(title: Errors.errorTitle.description, message: Errors.localization.description))
            }
        }
    }
}
