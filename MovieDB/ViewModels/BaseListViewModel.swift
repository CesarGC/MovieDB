//
//  BaseListViewModel.swift
//  MovieDB
//
//  Created by César García on 25/10/21.
//

import Foundation

protocol BaseListViewModelDelegate {
    func didReceiveMovieInfo()
    func didReceiveErrorInfo(error: Error!)
}

class BaseListViewModel {
    
    private(set) var listMovies: [MediaDB]! {
        didSet {
            self.refreshData()
        }
    }
    var apiService: MovieDBManager!
    
    init(_ delegate: BaseListViewModelDelegate) {
        self.apiService = MovieDBManager()
//        self.delegate = delegate
//        self.getMovies(0)
    }
    
    func refreshData() {
        
    }
    
    func setMoviesList(newList: [MediaDB]!) {
        self.listMovies = newList
    }
}
