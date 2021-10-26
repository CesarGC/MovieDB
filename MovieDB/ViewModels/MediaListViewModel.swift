//
//  MediaListViewModel.swift
//  MovieDB
//
//  Created by César García on 25/10/21.
//

import Foundation

class MediaListViewModel : BaseListViewModel {

    override init(_ delegate: BaseListViewModelDelegate) {
        super.init(delegate)
        self.delegate = delegate
    }
    
    override func refreshData() {
        self.delegate?.didReceiveMovieInfo()
    }
    
    func logOut(completion: @escaping
                    () -> Void) {
        UserDefaults.standard.removeObject(forKey: UserDefaultKeys.isLoggedIn.rawValue)
        UserDefaults.standard.removeObject(forKey: UserDefaultKeys.userName.rawValue)
        UserDefaults.standard.removeObject(forKey: UserDefaultKeys.sessionID.rawValue)
        UserDefaults.standard.removeObject(forKey: UserDefaultKeys.password.rawValue)
        UserDefaults.standard.removeObject(forKey: UserDefaultKeys.tokeRequest.rawValue)
        UserDefaults.standard.synchronize()
        completion()
    }
    
}
