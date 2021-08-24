//
//  HomeworldApi.swift
//  StarTrivia
//
//  Created by Apple on 23/08/21.
//

import Foundation
import Alamofire
 
class HomeworldApi {
    
    //MARK:- Web Request with Alamofire and Codable
    func getHomeworld(url: String , completion : @escaping HomeworldResponseCompletion) {
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
                let homeworld = try jsonDecoder.decode(Homeworld.self, from: data)
                completion(homeworld)
            }catch{
                debugPrint(error.localizedDescription)
                completion(nil)
               
            }
        }
    }
    
}
