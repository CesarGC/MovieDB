//
//  MovieCollectionViewCell.swift
//  MovieDB
//
//  Created by César García on 25/10/21.
//

import UIKit

class MediaCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var roundedView: UIView!
    
    @IBOutlet weak var lblOverview: UILabel!
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblVoteAverage: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    
    var media : MediaDB? {
        didSet {
            DispatchQueue.main.async {
                self.lblTitle.text = self.media?.title
                self.lblOverview.text = self.media?.overview
                self.imgMovie.url("\(ApiEndPoints.imageBaseURL)\(self.media?.image ?? "")")
                self.lblVoteAverage.text = "\(self.media?.vote ?? 0.0)"
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imgMovie.image = nil
        self.roundedView.clipsToBounds = true
        self.roundedView.layer.cornerRadius = 20
        
        self.roundedView.layer.cornerRadius = 8
        self.roundedView.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.roundedView.layer.shadowRadius = 3
        self.roundedView.layer.shadowOpacity = 0.3
        self.roundedView.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
        self.roundedView.layer.shouldRasterize = true
        self.roundedView.layer.rasterizationScale = UIScreen.main.scale
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imgMovie.image = nil
    }
}
