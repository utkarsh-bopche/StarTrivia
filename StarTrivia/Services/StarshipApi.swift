//
//  StarshipApi.swift
//  StarTrivia
//
//  Created by Apple on 24/08/21.
//

import Foundation
import Alamofire

class StarshipApi {
    //MARK:- Web Request with Alamofire and Codable
    func getStarship(url: String , completion : @escaping StarshipResponseCompletion) {
        guard let url = URL(string: url) else { return }
        AF.request(url).responseJSON { (response) in
            if let error = response.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            guard let data = response.data else {return completion(nil)}
            let jsonDecoder = JSONDecoder()
            do{
                let starship = try jsonDecoder.decode(Starship.self, from: data)
                completion(starship)
            }catch{
                debugPrint(error.localizedDescription)
                completion(nil)
               
            }
        }
    }
    
}
