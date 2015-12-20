//
//  ListInteractor.swift
//  iTunesCover
//
//  Created by Quentin Metzler on 20/12/15.
//  Copyright © 2015 LocalFitness. All rights reserved.
//

import Foundation

class ListInteractor : NSObject, ListInteractorInput {
    var output : ListInteractorOutput?
    
    let dataManager : ListDataManager
    
    init(dataManager: ListDataManager) {
        self.dataManager = dataManager
    }
    
    func findAlbums() {
        dataManager.searchItunesForAlbums { (covers : NSDictionary?) -> Void in
            if let covers = covers {
                let albums = self.albumsFromCovers(covers)
                self.output?.foundAlbums(albums)
            }
        }
    }
    
    func albumsFromCovers(covers: NSDictionary) -> [Album] {
        var albums = [Album]()
        
        guard let albumsArray = ((covers["feed"] as? NSDictionary)?["entry"] as? NSArray) else {
            return albums
        }
        
        for albumDict in albumsArray {
            guard let _ = albumDict as? NSDictionary else {
                continue
            }
            let album = Album(album: albumDict as! NSDictionary)
            albums.append(album)
        }
        
        return albums
    }
}