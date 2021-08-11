//
//  PersonApi.swift
//  StarTrivia
//
//  Created by Apple on 11/08/21.
//

import Foundation


class PersonApi{
    func getRandomPersonUrlSession()  {
        guard let url = URL(string: PERSON_URL) else { return }
    
        let task = URLSession.shared.dataTask(with: url, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
        
    }
}
