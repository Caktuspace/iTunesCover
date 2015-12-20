//
//  ListInteractorIO.swift
//  iTunesCover
//
//  Created by Quentin Metzler on 20/12/15.
//  Copyright © 2015 LocalFitness. All rights reserved.
//

import Foundation


protocol ListInteractorInput {
    func findAlbums()
}

protocol ListInteractorOutput {
    func foundAlbums(albums: [Album])
}
