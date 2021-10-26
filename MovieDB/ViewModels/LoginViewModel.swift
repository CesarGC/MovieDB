//
//  LoginViewModel.swift
//  MovieDB
//
//  Created by César García on 25/10/21.
//

import UIKit

protocol LoginViewModelDelegate {
    func didReceiveLoginResponse()
    func didReceiveError(message: String, title: String)
}

struct LoginViewModel {
    var delegate : LoginViewModelDelegate?
    let manager = MovieDBManager()
    
    init(delegate: LoginViewModelDelegate) {
        self.delegate = delegate
    }
    
    func loginUser(_ user: String, _ pass: String) {
        let validationResult = LoginValidation().validate(user, pass)
        if(validationResult.success) {
            self.manager.getAuthenticationToken { (authResponse) in
                if(authResponse!.success) {
                    self.manager.loginUser(loginRequest: LoginRequest(userEmail: user, userPassword: pass, requestToken: authResponse?.requestToken)) { (loginResponse) in
                        self.manager.getSessionID(sessionRequest: SessionRequest(requestToken: authResponse!.requestToken)) { (sessionRespose) in
                            if(sessionRespose!.success) {
                                self.saveUserInfo(sessionRespose!.sessionID, user, pass)
                                
                                DispatchQueue.main.async {
                                    self.delegate?.didReceiveLoginResponse()
                                }
                            }
                        } onError: { (error) in
                            self.delegate?.didReceiveError(message: error.localizedDescription, title: "Error")
                        }
                    } onError: { (error) in
                        self.delegate?.didReceiveError(message: error.localizedDescription, title: "Error")
                    }
                }
            } onError: { (error) in
                self.delegate?.didReceiveError(message: error.localizedDescription, title: "Error")
            }
        } else {
            self.delegate?.didReceiveError(message: validationResult.error!, title: "Error")
        }
    }
    
    func saveUserInfo(_ sessionID: String, _ userName:String, _ password:String) {
        UserDefaults.standard.setUserName(value: userName)
        UserDefaults.standard.setPassword(value: password)
        UserDefaults.standard.setSessionID(value: sessionID)
        UserDefaults.standard.setLoggedIn(value: true)
        UserDefaults.standard.synchronize()
    }

}
