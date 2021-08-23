//
//  Person.swift
//  StarTrivia
//
//  Created by Apple on 12/08/21.
//

import Foundation


struct Person : Codable {
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
    
    enum CodingKeys : String , CodingKey {
        case name = "name"
        case height = "height"
        case mass = "mass"
        case hair = "hair_color"
        case birthYear = "birth_year"
        case gender = "gender"
        case homeworldUrl = "homeworld"
        case filmUrls = "films"
        case vehicleUrls = "vehicles"
        case starshipUrls = "starships"
    }
}
