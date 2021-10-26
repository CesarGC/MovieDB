//
//  ListCollectionBaseViewController.swift
//  MovieDB
//
//  Created by César García on 25/10/21.
//

import UIKit

class ListCollectionBaseViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, BaseListViewModelDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel : BaseListViewModel!
    var collectionViewDataSource: MediaCollectionViewDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    func configViewModel() {
        self.viewModel = BaseListViewModel(self)
    }

    func setupUI() {
        self.configViewModel()
        self.collectionViewDataSource = MediaCollectionViewDataSource(self.viewModel)
        self.collectionView.dataSource = self.collectionViewDataSource
        self.collectionView.register(UINib.init(nibName: Constants.Cells.movieCellNibName, bundle: nil), forCellWithReuseIdentifier: Constants.Cells.movieCellIdentifier)
        self.collectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            let numberofItem: CGFloat = 2

            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

            let collectionViewWidth = self.collectionView.bounds.width
        let collectionViewHeight = self.collectionView.bounds.height*0.6

            let extraSpace = (numberofItem - 1) * flowLayout.minimumInteritemSpacing

            let inset = flowLayout.sectionInset.right + flowLayout.sectionInset.left

            let width = Float((collectionViewWidth - extraSpace - inset) / numberofItem)

        return CGSize(width: CGFloat(width), height: collectionViewHeight)
    }
    
    func didReceiveMovieInfo() {
        DispatchQueue.main.async {
            self.hideActivityIndicator()
            self.collectionView.setContentOffset(.zero, animated: false)
            self.collectionView.reloadData()
        }
    }
    
    func didReceiveErrorInfo(error: Error!) {
        DispatchQueue.main.async {
            self.showAlertController(title: "", message: "Ocurrio un problema al cargar la sección. Intenta mas tarde.")
        }
    }
    
}
