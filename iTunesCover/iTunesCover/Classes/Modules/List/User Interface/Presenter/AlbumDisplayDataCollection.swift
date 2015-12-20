//
//  AlbumDisplayDataCollection.swift
//  iTunesCover
//
//  Created by Quentin Metzler on 20/12/15.
//  Copyright © 2015 LocalFitness. All rights reserved.
//

import Foundation

class AlbumDisplayDataCollection {
    var items : [AlbumDisplayItem] = Array()
    
    init() {
    }
    
    func addAlbums(albums: [Album]) {
        for album in albums {
            addAlbum(album)
        }
    }
    
    func addAlbum(album: Album) {
        let displayItem = displayItemForAlbum(album)
        addDisplayItem(displayItem)
    }
    
    func addDisplayItem(displayItem: AlbumDisplayItem) {
        items.append(displayItem)
    }
    
    func displayItemForAlbum(album: Album) -> AlbumDisplayItem {
        let displayItem = AlbumDisplayItem(album: album)
        return displayItem
    }
    
    func collectedDisplayData() -> AlbumDisplayData {
        return AlbumDisplayData(items: sortedAlbumDisplayItems())
    }
    
    func sortedAlbumDisplayItems() -> [AlbumDisplayItem] {
        return items.sort({ $0.album.title < $1.album.title })
    }
    
}