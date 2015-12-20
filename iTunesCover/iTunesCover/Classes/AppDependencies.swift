//
//  AppDependencies.swift
//  AppDependencies
//
//  Created by Quentin Metzler on 20/12/15.
//  Copyright © 2015 LocalFitness. All rights reserved.
//

import Foundation
import UIKit

class AppDependencies {
    var listWireframe = ListWireframe()
    
    init() {
        configureDependencies()
    }
    
    func installRootViewControllerIntoWindow(window: UIWindow) {
        listWireframe.presentListInterfaceFromWindow(window)
    }
    
    func configureDependencies() {
        let rootWireframe = RootWireframe()
        
        let listPresenter = ListPresenter()
        let listDataManager = ListDataManager()
        let listInteractor = ListInteractor(dataManager: listDataManager)
        
        let detailWireframe = DetailWireframe()
        let detailPresenter = DetailPresenter()
        
        listInteractor.output = listPresenter
        
        listPresenter.listInteractor = listInteractor
        listPresenter.listWireframe = listWireframe
        
        listWireframe.detailWireframe = detailWireframe
        listWireframe.listPresenter = listPresenter
        listWireframe.rootWireframe = rootWireframe
        
        detailWireframe.detailPresenter = detailPresenter
        
        detailPresenter.detailWireframe = detailWireframe
        detailPresenter.detailModuleDelegate = listPresenter
    }
}