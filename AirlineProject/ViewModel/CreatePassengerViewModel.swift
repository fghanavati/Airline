//
//  NewPassengerViewMode.swift
//  AirlineProject
//
//  Created by Fatemeh Ghanavati  on 21/01/2022.
//

import Foundation
import Alamofire

typealias CreatePassengerInformation = (UserData?, ErrorModel?) -> Void
protocol CreatePassengerInformationProtocol {
    
    func CreatePassenger(name: String?, airline: String?, trips: String?, completion: @escaping CreatePassengerInformation)
}

class CreatePassengersViewModel {
    let service = NetworkingManager()
}


extension CreatePassengersViewModel: CreatePassengerInformationProtocol {
    func CreatePassenger(name: String?, airline: String?, trips: String?, completion: @escaping CreatePassengerInformation) {
        
        guard let name = name, !name.isEmpty, let trips = trips, !trips.isEmpty, let airline = airline, !airline.isEmpty else {
            completion(nil, ErrorModel(title: Errors.errorTitle.description, message: Errors.localization.description))
            return
        }
        service.postRequest(url: URLs.createPassenger.description, parameters: ["name": name, "airline": airline, "trips": trips]) {data, error in
            if error == nil {
                do {
                    if let data = data {
                        let decoded = try JSONDecoder().decode(UserData.self, from: data)
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
