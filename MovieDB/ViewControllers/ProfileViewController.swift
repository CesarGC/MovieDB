//
//  ProfileViewController.swift
//  MovieDB
//
//  Created by César García on 25/10/21.
//

import UIKit

class ProfileViewController: ListCollectionBaseViewController {
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblUsername: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configViewModel() {
        self.viewModel = ProfileViewModel(self)
        (self.viewModel as! ProfileViewModel).setDelegateProfile(self)
        self.showActivityIndicator()
    }
    
}

extension ProfileViewController: ProfileViewModelDelegate {
    func didReceiveUserInfo(user: User) {
        DispatchQueue.main.async {
            self.lblUsername.text = user.userName
            self.imgProfile.maskCircle()
            self.imgProfile.url(ApiEndPoints.imageBaseURL + user.avatar.tmdb.avatarPath)
        }
    }

    func didReceiveError(error: Error, userName: String) {
        DispatchQueue.main.async {
        self.showAlertController(title: Constants.ErrorAlertTitle, message: error.localizedDescription)
        self.lblUsername.text = userName
        }
    }
}
