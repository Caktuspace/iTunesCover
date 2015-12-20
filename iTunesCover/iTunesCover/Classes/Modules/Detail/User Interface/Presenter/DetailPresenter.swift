//
//  DetailPresenter.swift
//  iTunesCover
//
//  Created by Quentin Metzler on 20/12/15.
//  Copyright © 2015 LocalFitness. All rights reserved.
//

import Foundation

class DetailPresenter : NSObject, DetailModuleInterface {
    var detailWireframe : DetailWireframe?
    var detailModuleDelegate : DetailModuleDelegate?
    
    func backAction() {
        detailWireframe?.dismissDetailInterface()
        detailModuleDelegate?.detailModuleDidBackAction()
    }
}