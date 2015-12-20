//
//  ListWireframe.swift
//  iTunesCover
//
//  Created by Quentin Metzler on 20/12/15.
//  Copyright © 2015 LocalFitness. All rights reserved.
//

import Foundation
import UIKit

let ListViewControllerIdentifier = "ListViewController"

class ListWireframe : NSObject {
    var detailWireframe : DetailWireframe?
    var listPresenter : ListPresenter?
    var rootWireframe : RootWireframe?
    var listViewController : ListViewController?
    
    func presentListInterfaceFromWindow(window: UIWindow) {
        let viewController = listViewControllerFromStoryboard()
        viewController.eventHandler = listPresenter
        listViewController = viewController
        listPresenter!.userInterface = viewController
        rootWireframe?.showRootViewController(viewController, inWindow: window)
    }
    
    func presentDetailInterface(album : Album) {
        detailWireframe?.presentDetailInterfaceFromViewController(listViewController!.navigationController!, album : album)
    }
    
    func listViewControllerFromStoryboard() -> ListViewController {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewControllerWithIdentifier(ListViewControllerIdentifier) as! ListViewController
        return viewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        return storyboard
    }
    
}