//
//  AlbumDisplayData.swift
//  iTunesCover
//
//  Created by Quentin Metzler on 20/12/15.
//  Copyright © 2015 LocalFitness. All rights reserved.
//

import Foundation

struct AlbumDisplayData : Equatable {
    var items : [AlbumDisplayItem] = []
    
    init(items: [AlbumDisplayItem]) {
        self.items = items
    }
}

func == (leftSide: AlbumDisplayData, rightSide: AlbumDisplayData) -> Bool {
    var hasEqualSections = false
    hasEqualSections = rightSide.items == leftSide.items
    return hasEqualSections
}