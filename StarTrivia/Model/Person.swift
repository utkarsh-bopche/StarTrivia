//
//  Person.swift
//  StarTrivia
//
//  Created by Apple on 12/08/21.
//

import Foundation

struct Person : Decodable {
    let name : String
    let height : String
    let mass : String
    let hair : String
    let birthYear : String
    let gender : String
    let homeworldUrl : String
    let filmUrls : [String]
    let vehicleUrls : [String]
    let starshipUrls: [String]
    
    enum CodingKeys : String, CodingKey {
        case name
        case height
        case mass
        case hair = "hair_color"
        case birthYear = "birth_year"
        case gender
        case homeworldUrl = "homeworld"
        case filmUrls = "films"
        case vehiclesUrls = "vehicles"
        case starshipUrls = "starships"
    }
}
