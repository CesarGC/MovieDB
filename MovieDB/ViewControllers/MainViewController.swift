//
//  MainViewController.swift
//  MovieDB
//
//  Created by César García on 25/10/21.
//

import UIKit

class MainViewController: ListCollectionBaseViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.actionSegmentControlOptions(self.segmentControl)
    }
    
    override func configViewModel() {
        self.viewModel = MediaListViewModel(self)
    }
    
    @IBAction func actionSegmentControlOptions(_ sender: UISegmentedControl) {
        self.showActivityIndicator()
        (self.viewModel as! MediaListViewModel).getMovies(Category(typeCategory: TypeCategory(rawValue: sender.selectedSegmentIndex)!))
    }
    
    @IBAction func actionBarOptions(_ sender: Any) {
        let alert = UIAlertController.init(title: "", message: "What do you want to do?", preferredStyle: .actionSheet)
        let profileAction = UIAlertAction.init(title: "View Profile", style: .default) { (action) in
            self.presentControllerWithSegueIdentifier(identifier: Constants.Segue.profileIdentifier)
        }
        let logOutAction = UIAlertAction.init(title: "Log out", style: .destructive) { (action) in
            (self.viewModel as? MediaListViewModel)?.logOut(completion: {
                let viewController = LoginViewController.instantiate(from:.Signing)
                UIApplication.setRootView(viewController)
            })
        }
        alert.addAction(profileAction)
        alert.addAction(logOutAction)
        self.present(alert, animated: true, completion: nil)
    }
}
