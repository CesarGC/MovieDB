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
//    showSegueProfile
    
    override func configViewModel() {
        self.viewModel = MediaListViewModel(self)
    }
    
    @IBAction func actionSegmentControlOptions(_ sender: UISegmentedControl) {
        self.showActivityIndicator()
        (self.viewModel as! MediaListViewModel).getMovies(Category(typeCategory: TypeCategory(rawValue: sender.selectedSegmentIndex)!))
    }
    
    @IBAction func actionBarOptions(_ sender: Any) {
    }
}
