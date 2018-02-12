//
//  MoviesTableViewCell.swift
//  Assignment7
//
//  Created by LING HAO on 2/12/18.
//  Copyright © 2018 LING HAO. All rights reserved.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
    
    var movie: Movie! {
        didSet {
            movieTitle.text = movie.title
            movieOverview.text = movie.overview
            if let url = movie.posterUrl {
                moviePoster.setImageWith(url)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
