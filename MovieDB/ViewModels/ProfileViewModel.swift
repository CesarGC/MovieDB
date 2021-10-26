//
//  ProfileViewModel.swift
//  MovieDB
//
//  Created by César García on 26/10/21.
//

import Foundation

protocol ProfileViewModelDelegate {
    func didReceiveUserInfo(user: User)
    func didReceiveError(error: Error, userName: String)
}

class ProfileViewModel: MediaListViewModel {
    var delegateProfile : ProfileViewModelDelegate?
    
    override init(_ delegate: BaseListViewModelDelegate) {
        super.init(delegate)
        getMovies(Category(typeCategory: .favorite, typeMedia: .tv, typeMediaList: .favorite))
    }
    
    func setDelegateProfile(_ delegate: ProfileViewModelDelegate) {
        self.delegateProfile = delegate
        self.getUserInfo()
    }
    
    func getUserInfo() {
        self.apiService.getUserInfo { (response) in
            self.delegateProfile?.didReceiveUserInfo(user: response!)
        } onError: { (error) in
            self.delegateProfile?.didReceiveError(error: error, userName: UserDefaults.standard.getUserName())
        }
    }
    
}
