//
//  User.swift
//  MovieDB
//
//  Created by César García on 26/10/21.
//

import Foundation

struct User: Decodable {
    let userName: String
    let avatar: Avatar
    
    enum CodingKeys: String, CodingKey {
        case userName = "username"
        case avatar
    }
}

struct Avatar: Decodable {
    let tmdb: Tmdb
}

struct Tmdb: Decodable {
    let avatarPath: String
    
    enum CodingKeys: String, CodingKey {
        case avatarPath = "avatar_path"
    }
}
