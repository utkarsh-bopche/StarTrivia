//
//  Constants.swift
//  StarTrivia
//
//  Created by Apple on 11/08/21.
//

import UIKit

let BLACK_BG = UIColor.black.withAlphaComponent(0.6).cgColor

let BASE_URL = "https://swapi.dev/api/"
let PERSON_URL = BASE_URL + "people/"

typealias PersonResponseCompletion = (Person?) -> Void
typealias HomeworldResponseCompletion = (Homeworld?) -> Void
typealias VehicleResponseCompletion = (Vehicle?) -> Void
