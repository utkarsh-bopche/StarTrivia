//
//  FilmApi.swift
//  StarTrivia
//
//  Created by Apple on 24/08/21.
//

import Foundation
import Alamofire

class FilmsApi{
    //MARK:- Web Request with Alamofire and Codable
    func getFilm(url:String, completion: @escaping FilmResponseCompletion) {
        guard let url = URL(string: url) else { return}
        AF.request(url).responseJSON { (response) in
            if let error = response.error{
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            guard let data = response.data else {return completion(nil)}
             let jsonDecoder = JSONDecoder()
            do{
                let film = try jsonDecoder.decode(Film.self, from: data)
                completion(film)
                return
            }catch{
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
