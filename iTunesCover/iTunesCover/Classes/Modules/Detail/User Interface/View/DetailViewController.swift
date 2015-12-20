//
//  DetailViewController.swift
//  iTunesCover
//
//  Created by Quentin Metzler on 20/12/15.
//  Copyright © 2015 LocalFitness. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController, DetailViewInterface {
    var eventHandler : DetailModuleInterface?
    var albumDetail : Album?
    
    @IBOutlet var coverImageView : UIImageView!
    @IBOutlet var descriptionLabel : UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let album = albumDetail {
            if let url = album.imageURL {
                coverImageView.downloadedFrom(link: url, contentMode: .ScaleAspectFit)
            }
            descriptionLabel.text = album.description
        }
    }
    
    func setAlbum(album: Album?) {
        self.albumDetail = album
    }
}