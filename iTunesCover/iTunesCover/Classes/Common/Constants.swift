//
//  Constants.swift
//  iTunesCover
//
//  Created by Quentin Metzler on 20/12/15.
//  Copyright © 2015 LocalFitness. All rights reserved.
//

import Foundation

struct Constants {
    struct iTunesUrls {
        static let urlTop10 = "https://itunes.apple.com/us/rss/topalbums/json"
        static let urlTop25 = "https://itunes.apple.com/us/rss/topalbums/limit=25/json"
        static let urlTop50 = "https://itunes.apple.com/us/rss/topalbums/limit=50/json"
    }
    
    struct CarouselContent {
        static let height = CGFloat(0.8)
        static let width = CGFloat(0.8)
    }
}