//
//  ListPresenter.swift
//  iTunesCover
//
//  Created by Quentin Metzler on 20/12/15.
//  Copyright © 2015 LocalFitness. All rights reserved.
//

import Foundation
import UIKit

class ListPresenter : NSObject, ListInteractorOutput, ListModuleInterface, DetailModuleDelegate {
    var listInteractor : ListInteractorInput?
    var listWireframe : ListWireframe?
    var userInterface : ListViewInterface?
    
    func updateView() {
        listInteractor?.findAlbums()
    }
    
    func foundAlbums(albums: [Album]) {
        if albums.count == 0 {
            userInterface?.showNoContentMessage()
        } else {
            updateUserInterfaceWithAlbums(albums)
        }
    }
    
    func updateUserInterfaceWithAlbums(albums: [Album]) {
        let albumDisplayData = albumDisplayDataWithItems(albums)
        userInterface?.showAlbumDisplayData(albumDisplayData)
    }
    
    func albumDisplayDataWithItems(albums: [Album]) -> AlbumDisplayData {
        let collection = AlbumDisplayDataCollection()
        collection.addAlbums(albums)
        return collection.collectedDisplayData()
    }
    
    func showDetail(album : Album) {
        listWireframe?.presentDetailInterface(album)
    }
    
    func detailModuleDidBackAction() {
        // No action necessary
    }
}