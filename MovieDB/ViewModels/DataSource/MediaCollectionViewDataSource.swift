//
//  MediaCollectionViewDataSource.swift
//  MovieDB
//
//  Created by César García on 25/10/21.
//

import UIKit

class MediaCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    private let listViewModel: BaseListViewModel
    
    init(_ listViewModel: BaseListViewModel) {
        self.listViewModel = listViewModel
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if ((self.listViewModel.listMovies) != nil) {
            return self.listViewModel.listMovies.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Cells.movieCellIdentifier, for: indexPath) as! MediaCollectionViewCell
        cell.media = self.listViewModel.listMovies[indexPath.row]
        return cell
    }
}
