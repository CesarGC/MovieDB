//
//  MovieDBManager.swift
//  MovieDB
//
//  Created by César García on 25/10/21.
//

import Foundation

struct MovieDBManager {
    func loginUser(loginRequest: LoginRequest, completion: @escaping
                    (_ result:LoginResponse?) -> Void, onError: @escaping (Error) -> Void) {
        let loginUrl = URL(string: ApiEndPoints.login)!
        let httpUtility = HttpUtility()
        do {
            let loginPostBody = try JSONEncoder().encode(loginRequest)
            httpUtility.postApiData(requestURL: loginUrl, requestBody: loginPostBody, resultType: LoginResponse.self) { (response, error) in
                if(error == nil) {
                    _ = completion(response)
                }
            } onError: { (error) in
                onError(NSError(domain: "", code: 401, userInfo: [ NSLocalizedDescriptionKey: "Verifica que el usuario y contraseña sean validos"]))
            }
        } catch let error {
            onError(error)
        }
    }
    
    func getAuthenticationToken(completion: @escaping (_ result: LoginResponse?) -> Void, onError: @escaping (Error) -> Void) {
        let tokenUrl = URL(string: ApiEndPoints.token)!
        let httpUtility = HttpUtility()
        httpUtility.getApiData(requestURL: tokenUrl, requestType: LoginResponse.self) { (response) in
            _ = completion(response!)
        } onError: { (error) in
            onError(error)
        }
    }
    
    func getSessionID(sessionRequest: SessionRequest, completion: @escaping (_ result: SessionResponse?) -> Void, onError: @escaping (Error) -> Void) {
        let sessionUrl = URL(string: ApiEndPoints.session)!
        let httpUtility = HttpUtility()
        do {
            let sessionPostBody = try JSONEncoder().encode(sessionRequest)
            httpUtility.postApiData(requestURL: sessionUrl, requestBody: sessionPostBody, resultType: SessionResponse.self) { (response, error) in
                if(error == nil) {
                _ = completion(response)
                }
            } onError: { (error) in
                onError(error)
            }
        } catch let error {
            onError(error)
        }
    }
    func getMediaList(category: Category, completion: @escaping
                    (_ result: MediaResponse?) -> Void, onError: @escaping (Error) -> Void) {
        let categoryString = category.typeMedia.rawValue + category.typeMediaList.rawValue
        let urlString = String(format: ApiEndPoints.base_list_movie, categoryString)
        let loginUrl = URL(string: urlString)!
        let httpUtility = HttpUtility()
        httpUtility.getApiData(requestURL: loginUrl, requestType: MediaResponse.self) { (response) in
            _ = completion(response)
        } onError: { (error) in
            onError(error)
        }
    }
}
