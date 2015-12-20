//
//  ListViewController.swift
//  iTunesCover
//
//  Created by Quentin Metzler on 20/12/15.
//  Copyright © 2015 LocalFitness. All rights reserved.
//

import Foundation
import UIKit

var ListEntryCellIdentifier = "ListEntryCell"

class ListViewController : UIViewController, iCarouselDataSource, iCarouselDelegate, ListViewInterface {
    var eventHandler : ListModuleInterface?
    var dataProperty : AlbumDisplayData?
    var carousel : iCarousel?
    var strongContentView : UIView?
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var coverDescription: UILabel!
    @IBOutlet weak var noContentView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        strongContentView = view
        configureView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        eventHandler?.updateView()
    }
    
    func configureView() {
        navigationItem.title = "iTunes Top Albums"
        
        carousel = initCarousel(topView)
        addCarouselConstraint(carousel!, view : topView)
    }
    
    func initCarousel(view : UIView) -> iCarousel {
        let carousel = iCarousel(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        carousel.dataSource = self
        carousel.delegate = self
        carousel.type = .CoverFlow
        carousel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(carousel)
        
        return carousel
    }
    
    func addCarouselConstraint(carousel : iCarousel, view : UIView) {
        let horizontalConstraint = carousel.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor)
        let vertivalConstraint = carousel.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor)
        let widthConstraint = carousel.widthAnchor.constraintEqualToAnchor(view.widthAnchor, constant: 0)
        let heightConstraint = carousel.heightAnchor.constraintEqualToAnchor(view.heightAnchor, constant: 0)
        NSLayoutConstraint.activateConstraints([horizontalConstraint, vertivalConstraint, widthConstraint, heightConstraint])
    }
    
    @IBAction func didTapNextButton (sender: UIButton) {
        eventHandler?.showDetail(dataProperty!.items[carousel!.currentItemIndex].album)
    }
    
    func showNoContentMessage() {
        view = noContentView
    }
    
    func showAlbumDisplayData(data: AlbumDisplayData) {
        view = strongContentView
        
        dataProperty = data
        reloadEntries()
    }
    
    func reloadEntries() {
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.carousel?.reloadData()
        }
    }
    
    func numberOfItemsInCarousel(carousel: iCarousel) -> Int {
        guard let _ = dataProperty?.items.count else {
            return 0
        }
        return dataProperty!.items.count
    }
    
    func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView {
        let imageView: UIImageView
        
        if view != nil {
            imageView = view as! UIImageView
        } else {
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: carousel.bounds.width * Constants.CarouselContent.width, height: carousel.bounds.height * Constants.CarouselContent.height))
        }
        
        if dataProperty!.items[index].album.imageURL != nil {
            imageView.downloadedFrom(link : dataProperty!.items[index].album.imageURL!, contentMode : .ScaleAspectFit)
        }
        
        return imageView
    }
    
    func carouselCurrentItemIndexDidChange(carousel : iCarousel) {
        let index = carousel.currentItemIndex
        guard let albums = dataProperty?.items else {
            return
        }
        let album = albums[index]
        coverDescription.text = album.description
    }
}