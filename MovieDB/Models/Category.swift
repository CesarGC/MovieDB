//
//  Category.swift
//  MovieDB
//
//  Created by César García on 25/10/21.
//

import Foundation

struct Category {
    let type: TypeCategory
    let typeMedia: TypeMedia
    let typeMediaList: TypeListMediaEndPointsEnum
    
    init(typeCategory: TypeCategory) {
        self.type = typeCategory
        switch self.type {
        case .tvTopRated, .tvPopular:
            self.typeMedia = .tv
        case .movieTopRated, .moviePopular:
            self.typeMedia = .movie
        case .favorite:
            self.typeMedia = .tv
        }
        
        switch typeCategory {
        case .tvTopRated, .movieTopRated:
            self.typeMediaList = .top_rated
        case .tvPopular, .moviePopular:
            self.typeMediaList = .popular
        case .favorite:
            self.typeMediaList = .favorite
        }
    }
    
    init(typeCategory: TypeCategory, typeMedia: TypeMedia, typeMediaList: TypeListMediaEndPointsEnum) {
        self.type = typeCategory
        self.typeMedia = typeMedia
        self.typeMediaList = typeMediaList
    }
    
}

enum TypeCategory: Int {
    case tvTopRated = 0
    case tvPopular = 1
    case movieTopRated = 2
    case moviePopular = 3
    case favorite = 4
}

enum TypeMedia: String {
    case movie = "movie"
    case tv = "tv"
}

enum TypeListMediaEndPointsEnum: String {
    case popular = "/popular"
    case top_rated = "/top_rated"
    case favorite = "/favorite"
}
