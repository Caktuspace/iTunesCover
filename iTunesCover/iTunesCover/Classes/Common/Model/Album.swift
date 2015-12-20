//
//  Album.swift
//  iTunesCover
//
//  Created by Quentin Metzler on 20/12/15.
//  Copyright © 2015 LocalFitness. All rights reserved.
//

import UIKit

class Album: NSObject {
    var title : String?
    var artist : String?
    var longTitle : String?
    var imageURL : String?
    var songCount : String?
    var price : String?
    var releaseDate : String?
    
    required init(album : NSDictionary) {
        self.title = (album["im:name"] as? NSDictionary)?["label"] as? String
        self.artist = (album["im:artist"] as? NSDictionary)?["label"] as? String
        self.longTitle = (album["title"] as? NSDictionary)?["label"] as? String
        self.imageURL = ((album["im:image"] as? NSArray)?[2] as? NSDictionary)?["label"] as? String
        self.songCount = (album["im:itemCount"] as? NSDictionary)?["label"] as? String
        self.price = (album["im:price"] as? NSDictionary)?["label"] as? String
        self.releaseDate = ((album["im:releaseDate"] as? NSDictionary)?["attributes"] as? NSDictionary)?["label"] as? String
    }
    
    override var description: String {
        return String(format: NSLocalizedString("coverDescription", comment: "cover description"), title ?? NSLocalizedString("unknown", comment: "unknown"), artist ?? NSLocalizedString("unknown", comment: "unknown"), songCount ?? NSLocalizedString("unknown", comment: "unknown"), price ?? NSLocalizedString("unknown", comment: "unknown"), releaseDate ?? NSLocalizedString("unknown", comment: "unknown"))
    }
}
