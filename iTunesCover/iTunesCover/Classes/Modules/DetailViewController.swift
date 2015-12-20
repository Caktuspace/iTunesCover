//
//  DetailViewController.swift
//  iTunesCover
//
//  Created by Quentin Metzler on 21/12/15.
//  Copyright © 2015 LocalFitness. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var coverAtwork: UIImageView!
    @IBOutlet weak var coverDescription: UILabel!
    var album : Album!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if album.imageURL != nil {
            coverAtwork.downloadedFrom(link: album!.imageURL!, contentMode: .ScaleAspectFit)
        }
        
        coverDescription.text = album.description

        navigationItem.title = album.longTitle
    }
}
