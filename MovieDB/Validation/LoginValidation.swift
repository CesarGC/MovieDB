//
//  LoginValidation.swift
//  MovieDB
//
//  Created by César García on 25/10/21.
//

import Foundation

struct ValidationResult {
    let success: Bool
    let error: String?
}

struct LoginValidation {
    func validate(_ user: String, _ pass: String) -> ValidationResult {
        if(user.isEmpty) {
            return ValidationResult(success: false, error: "User email is empty")
        }
        if(pass.isEmpty) {
            return ValidationResult(success: false, error: "User pass is empty")
        }
        
        return ValidationResult(success: true, error: nil)
    }
}
