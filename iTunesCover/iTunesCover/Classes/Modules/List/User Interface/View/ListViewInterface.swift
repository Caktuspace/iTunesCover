//
//  ListViewInterface.swift
//  iTunesCover
//
//  Created by Quentin Metzler on 20/12/15.
//  Copyright © 2015 LocalFitness. All rights reserved.
//

import Foundation

protocol ListViewInterface {
    func showNoContentMessage()
    func showAlbumDisplayData(data: AlbumDisplayData)
    func reloadEntries ()
}
    

