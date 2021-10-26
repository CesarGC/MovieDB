//
//  Session.swift
//  MovieDB
//
//  Created by César García on 25/10/21.
//

import Foundation

struct SessionResponse: Decodable {
    let success: Bool
    let sessionID: String
    
    enum CodingKeys: String, CodingKey {
        case success
        case sessionID = "session_id"
    }
}

struct SessionRequest: Encodable {
    let requestToken: String
    
    enum CodingKeys: String, CodingKey {
        case requestToken = "request_token"
    }
}
