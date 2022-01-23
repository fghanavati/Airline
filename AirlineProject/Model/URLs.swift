//
//  URLs.swift
//  AirlineProject
//
//  Created by Fatemeh Ghanavati  on 22/01/2022.
//

import Foundation

enum URLs {
    case passenger
    case createPassenger
    
    var baseURLstring: String {
        return "https://api.instantwebtools.net/v1/"
    }

    func prepareURL(targetURL: String) -> URL {
        return URL(string: baseURLstring + targetURL)!
    }
 
    static func passengerUrl(currentPage: Int) -> URL {
        return URL(string: "passenger?page=\(currentPage)&size=10")!
    }

    var description: URL {
        switch self {
            
        case .passenger:
            return prepareURL(targetURL: "passenger?page=0&size=10")
        case .createPassenger:
            return prepareURL(targetURL: "passenger")
        }
    }
    
}

enum Errors {
    case failedJson
    case errorTitle
    case localization
   
    
    var description: String {
        switch self {
            
        case .failedJson:
            return "Failed to decode json"
        case .errorTitle:
            return "Error"
        case .localization:
            return "Check your data Please!"
        }
    }
}

