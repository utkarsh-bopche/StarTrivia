//
//  PersonApi.swift
//  StarTrivia
//
//  Created by Apple on 11/08/21.
//

import Foundation


class PersonApi {
    
    //MARK:- Api Calling
    func getRandomPersonUrlSession()  {
        guard let url = URL(string: PERSON_URL) else {
            return
        }
       
    
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                debugPrint(error.debugDescription)
                return
            }
            guard let data = data else {return}
            do {
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
                guard let json = jsonAny as? [String:Any] else {return}
             let person = self.parsePersonManual(json: json)
                print(person.name)
                print(person.filmUrls)
                
            } catch{
                debugPrint(error.localizedDescription)
                return
            }
           
           
        }
        task.resume()
       
    }
    
    //MARK:- Private Functions
    
    private func parsePersonManual(json:[String: Any]) -> Person {
//        let names = ["nameOne" :"JonnyB" , "nameTwo" : "BillyJean"]
//
//        let jonny = names["nameOne"]
//        let billy = names["nameTwo"]
        let name = json["name"] as? String ?? ""
        let height = json["height"] as? String ?? ""
        let mass = json["mass"] as? String ?? ""
        let hair = json["hair_color"] as? String ?? ""
        let birthYear = json["birth_year"] as? String ?? ""
        let gender = json["gender"] as? String ?? ""
        let homeworldUrl = json["homeworld"] as? String ?? ""
        let filmUrls = json["films"] as? [String] ?? [String]()
        let vehicleUrls = json["vehicles"] as? [String] ?? [String]()
        let starshipUrls = json["starships"] as? [String] ?? [String]()
        
        let person = Person(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeworldUrl: homeworldUrl, filmUrls: filmUrls, vehicleUrls: vehicleUrls, starshipUrls: starshipUrls)
        return person
    }
}
