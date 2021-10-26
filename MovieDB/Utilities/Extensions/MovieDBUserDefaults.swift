//
//  MovieDBUserDefaults.swift
//  MovieDB
//
//  Created by César García on 25/10/21.
//

import Foundation

extension UserDefaults {
    func setLoggedIn(value: Bool) {
        setValue(value, forKey: UserDefaultKeys.isLoggedIn.rawValue)
    }
    
    func isLoggedIn() -> Bool {
        return bool(forKey: UserDefaultKeys.isLoggedIn.rawValue)
    }
    
    func setUserName(value: String) {
        setValue(value, forKey: UserDefaultKeys.userName.rawValue)
    }
    
    func getUserName() -> String {
        if let userName = string(forKey: UserDefaultKeys.userName.rawValue) {
            return userName
        }
        return ""
    }
    
    func setSessionID(value: String) {
        setValue(value, forKey: UserDefaultKeys.sessionID.rawValue)
    }
    
    func getSessionID() -> String {
        if let session = string(forKey: UserDefaultKeys.sessionID.rawValue) {
            return session
        }
        return ""
    }
    
    func setPassword(value: String) {
        setValue(value, forKey: UserDefaultKeys.password.rawValue)
    }
    
    func getPassword() -> String {
        if let password = string(forKey: UserDefaultKeys.password.rawValue) {
            return password
        }
        return ""
    }
    
    enum UserDefaultKeys: String {
        case isLoggedIn = "login_flag"
        case userName = "user_name"
        case sessionID = "user_session_id"
        case password = "password_name"
        case tokeRequest = "token_request"
    }
}
