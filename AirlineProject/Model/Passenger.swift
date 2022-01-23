//
//  Passenger.swift
//  AirlineProject
//
//  Created by Fatemeh Ghanavati  on 21/01/2022.
//


import Foundation


struct Passengers : Codable {
    let totalPassengers : Int?
    let totalPages : Int?
    let data : [UserData]?
    
    enum CodingKeys: String, CodingKey {
        
        case totalPassengers = "totalPassengers"
        case totalPages = "totalPages"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        totalPassengers = try values.decodeIfPresent(Int.self, forKey: .totalPassengers)
        totalPages = try values.decodeIfPresent(Int.self, forKey: .totalPages)
        data = try values.decodeIfPresent([UserData].self, forKey: .data)
    }
    
}

struct UserData : Codable {
    let _id : String?
    let name : String?
    let trips : Int?
    let airline : [Airline]?
    let __v : Int?
    
    
    enum CodingKeys: String, CodingKey {
        
        case _id = "_id"
        case name = "name"
        case trips = "trips"
        case airline = "airline"
        case __v = "__v"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        _id = try values.decodeIfPresent(String.self, forKey: ._id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        trips = try values.decodeIfPresent(Int.self, forKey: .trips)
        airline = try values.decodeIfPresent([Airline].self, forKey: .airline)
        __v = try values.decodeIfPresent(Int.self, forKey: .__v)
    }
    
}


struct Airline : Codable {
    let id : Int?
    let name : String?
    let country : String?
    let logo : String?
    let slogan : String?
    let head_quaters : String?
    let website : String?
    let established : String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
        case country = "country"
        case logo = "logo"
        case slogan = "slogan"
        case head_quaters = "head_quaters"
        case website = "website"
        case established = "established"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        logo = try values.decodeIfPresent(String.self, forKey: .logo)
        slogan = try values.decodeIfPresent(String.self, forKey: .slogan)
        head_quaters = try values.decodeIfPresent(String.self, forKey: .head_quaters)
        website = try values.decodeIfPresent(String.self, forKey: .website)
        established = try values.decodeIfPresent(String.self, forKey: .established)
    }
    
}
