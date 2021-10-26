//
//  Login.swift
//  MovieDB
//
//  Created by César García on 25/10/21.
//

import Foundation

struct LoginRequest: Encodable {
    var userEmail, userPassword, requestToken: String?
    
    enum CodingKeys: String, CodingKey {
        case userEmail = "username"
        case userPassword = "password"
        case requestToken = "request_token"
    }
}

struct LoginResponse: Decodable {
    let success: Bool
    let dateExpiration: String
    let requestToken: String
    
    enum CodingKeys: String, CodingKey {
        case success
        case dateExpiration = "expires_at"
        case requestToken = "request_token"
    }
}
