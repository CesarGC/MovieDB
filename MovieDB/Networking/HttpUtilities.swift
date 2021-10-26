//
//  HttpUtilities.swift
//  MovieDB
//
//  Created by César García on 25/10/21.
//

import Foundation

struct HttpUtility {
    
    func getApiData<T:Decodable>(requestURL: URL, requestType: T.Type, completionHandler:@escaping(_ result: T?) -> Void, onError: @escaping (Error) -> Void) {
        URLSession.shared.dataTask(with: requestURL) { (responseData, httpUrlResponse, error) in
            if(error == nil && responseData != nil && responseData?.count != 0) {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: responseData!)
                    _ = completionHandler(result)
                } catch let error {
                    onError(error)
                }
            }
        }.resume()
    }
    
    func postApiData<T:Decodable>(requestURL: URL, requestBody: Data, resultType: T.Type, completionHandler:@escaping(_ result: T?, Error?) -> Void, onError: @escaping (Error) -> Void) {
        var urlRequest = URLRequest(url: requestURL)
        urlRequest.httpMethod = "post"
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if(data != nil && data?.count != 0) {
                do {
                    let response = try JSONDecoder().decode(T.self, from: data!)
                    _ = completionHandler(response, nil)
                } catch let error {
                    onError(error)
                }
            }
        }.resume()
    }
}
