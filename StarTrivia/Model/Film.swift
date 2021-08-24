//
//  Film.swift
//  StarTrivia
//
//  Created by Apple on 24/08/21.
//

import Foundation

//Film Model
struct Film : Codable {
    let title:String
    let episode:Int
    let director:String
    let producer:String
    let releaseDate:String
    let crawl : String
    
    enum CodingKeys : String,CodingKey {
        case title
        case episode = "episode_id"
        case director
        case crawl = "opening_crawl"
        case producer
        case releaseDate = "release_date"
    }
    
}
