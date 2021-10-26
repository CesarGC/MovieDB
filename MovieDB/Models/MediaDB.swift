//
//  MovieDB.swift
//  MovieDB
//
//  Created by César García on 25/10/21.
//

import Foundation

struct MediaResponse: Decodable {
    let page: Int
    let results: [MediaDB]
    let total_pages: Int
    let total_results: Int
}

struct MediaDB: Decodable {
    
    let id: Int
    let releaseDate: String?
    var title: String?
    let overview: String?
    let image: String?
    let vote: Float?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case name
        case originalName = "original_name"
        case overview
        case releaseDate = "release_date"
        case firstDate = "first_air_date"
        case image = "poster_path"
        case vote = "vote_average"
        
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let tempId = try? container.decode(Int.self, forKey: .id) {
            id = tempId
        } else {
            id = 0
        }
        
        if let tempTitle = try? container.decode(String.self, forKey: .title) {
            title = tempTitle
        } else {
            title = try? container.decode(String.self, forKey: .name)
        }
        
        if let tempDate = try? container.decode(String.self, forKey: .releaseDate) {
            releaseDate =  tempDate
        } else {
            releaseDate = try? container.decode(String.self, forKey: .firstDate)
        }
        
        if let tempOverview = try? container.decode(String.self, forKey: .overview) {
            overview = tempOverview
        } else {
            overview = try? container.decode(String.self, forKey: .overview)
        }
        
        image = try? container.decode(String.self, forKey: .image)
        
        vote = try? container.decode(Float.self, forKey: .vote)
    }
    
}
