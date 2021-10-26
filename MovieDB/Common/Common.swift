//
//  Common.swift
//  MovieDB
//
//  Created by César García on 25/10/21.
//

import Foundation

struct Constants {
    static let ErrorAlertTitle = "Error"
    static let OKAlertTitle = "Ok"
    static let CancelAlertTitle = "Cancel"
    
    struct Cells {
        static let movieCellNibName = "MovieCollectionViewCell"
        static let movieCellIdentifier = "cellMovieIdentifier"
    }
}

struct ApiEndPoints {
    static let api_key = "a7f0d41b32c28da6a188b8b194080ae5"
    static let base_url = "https://api.themoviedb.org/3/"
    static let token = base_url + "authentication/token/new?api_key=\(api_key)"
    static let session = base_url + "authentication/session/new?api_key=\(api_key)"
    static let login = base_url + "authentication/token/validate_with_login?api_key=\(api_key)"
}
