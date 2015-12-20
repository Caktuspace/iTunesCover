//
//  AlbumDisplayItem.swift
//  iTunesCover
//
//  Created by Quentin Metzler on 20/12/15.
//  Copyright © 2015 LocalFitness. All rights reserved.
//

import Foundation

struct AlbumDisplayItem : Equatable, CustomStringConvertible {
    var album : Album
    
    var description : String { get {
        return album.description
        }}
    
    init(album: Album) {
        self.album = album
    }
}

func == (leftSide: AlbumDisplayItem, rightSide: AlbumDisplayItem) -> Bool {
    var hasEqualSections = false
    hasEqualSections = rightSide.album == leftSide.album
    
    return hasEqualSections
}