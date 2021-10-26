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
    
    var delegate : BaseListViewModelDelegate?
    private(set) var listMovies: [MediaDB]! {
        didSet {
            self.refreshData()
        }
    }
    private(set) var apiService: MovieDBManager!
    
    init(_ delegate: BaseListViewModelDelegate) {
        self.apiService = MovieDBManager()
    }
    
    func refreshData() {
    }
    
    func getMovies(_ category: Category) {
        self.apiService.getMediaList(category: category) { (response) in
            self.setMoviesList(newList: response?.results)
        } onError: { (error) in
            self.setMoviesList(newList: nil)
            self.delegate?.didReceiveErrorInfo(error: error)
        }
    }
    
    func setMoviesList(newList: [MediaDB]!) {
        self.listMovies = newList
    }
}
