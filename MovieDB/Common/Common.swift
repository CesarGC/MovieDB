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
        static let movieCellNibName = "MediaCollectionViewCell"
        static let movieCellIdentifier = "cellMovieIdentifier"
    }
    
    struct Segue {
        static let profileIdentifier = "showSegueProfile"
    }
}

struct ApiEndPoints {
    static let api_key = "a7f0d41b32c28da6a188b8b194080ae5"
    static let base_url = "https://api.themoviedb.org/3/"
    static let token = base_url + "authentication/token/new?api_key=\(api_key)"
    static let session = base_url + "authentication/session/new?api_key=\(api_key)"
    static let login = base_url + "authentication/token/validate_with_login?api_key=\(api_key)"
    static let base_list_movie = base_url + "%@?api_key=\(api_key)&language=en-US&page=1"
    static let favorites_shows = base_url + "account/%7Baccount_id%7D/favorite/tv?api_key=\(api_key)&language=en-US&sort_by=created_at.asc&page=1&session_id="
    static let user_info = base_url + "account?api_key=\(api_key)&session_id="
    static let imageBaseURL = "https://image.tmdb.org/t/p/w500/"
}
