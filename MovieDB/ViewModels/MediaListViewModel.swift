//
//  MediaListViewModel.swift
//  MovieDB
//
//  Created by César García on 25/10/21.
//

import Foundation

class MediaListViewModel : BaseListViewModel {
    var delegate : BaseListViewModelDelegate?

    override init(_ delegate: BaseListViewModelDelegate) {
        super.init(delegate)
        self.delegate = delegate
    }
    
    func getMovies(_ category: Category) {
        self.apiService.getMediaList(category: category) { (response) in
            self.setMoviesList(newList: response?.results)
        } onError: { (error) in
            self.setMoviesList(newList: nil)
            self.delegate?.didReceiveErrorInfo(error: error)
        }
    }
    
    override func refreshData() {
        self.delegate?.didReceiveMovieInfo()
    }
}
