//
//  Movie.swift
//  Assignment7
//
//  Created by LING HAO on 2/12/18.
//  Copyright © 2018 LING HAO. All rights reserved.
//

import UIKit

class Movie: NSObject {
    
    var title: String?
    var overview: String?
    var posterUrl: String? {
        get {
            if let posterPath = self.posterPath {
                let base = "https://image.tmdb.org/t/p/w500"
                return base + posterPath
            } else {
                return nil
            }
        }
    }
    var posterPath: String?

    init(title: String?, overview: String?, posterPath: String?) {
        self.title = title
        self.overview = overview
        self.posterPath = posterPath
    }
}
