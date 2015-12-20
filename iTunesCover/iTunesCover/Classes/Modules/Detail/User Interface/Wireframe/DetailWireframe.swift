//
//  DetailWireframe.swift
//  iTunesCover
//
//  Created by Quentin Metzler on 20/12/15.
//  Copyright © 2015 LocalFitness. All rights reserved.
//

import Foundation
import UIKit

let DetailViewControllerIdentifier = "DetailViewController"

class DetailWireframe : NSObject {

    var detailPresenter : DetailPresenter?
    var presentedViewController : UIViewController?
    
    func presentDetailInterfaceFromViewController(navController: UINavigationController, album : Album) {
        let newViewController = detailViewControllerFromStoryboard()
        newViewController.eventHandler = detailPresenter
        newViewController.setAlbum(album)
        
        
        navController.pushViewController(newViewController, animated: true)
        
        presentedViewController = newViewController
    }
    
    func dismissDetailInterface() {
        presentedViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func detailViewControllerFromStoryboard() -> DetailViewController {
        let storyboard = mainStoryboard()
        let detailViewController: DetailViewController = storyboard.instantiateViewControllerWithIdentifier(DetailViewControllerIdentifier) as! DetailViewController
        return detailViewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        return storyboard
    }
}