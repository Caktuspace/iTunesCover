//
//  UIImage+download.swift
//  iTunesCover
//
//  Created by Quentin Metzler on 20/12/15.
//  Copyright © 2015 LocalFitness. All rights reserved.
//

import Foundation

extension UIImageView {
    func downloadedFrom(link link:String, contentMode mode: UIViewContentMode) {
        guard
            let url = NSURL(string: link)
            else {return}
        contentMode = mode
        NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, _, error) -> Void in
            guard
                let data = data where error == nil,
                let image = UIImage(data: data)
                else { return }
            dispatch_async(dispatch_get_main_queue(), {
                self.image = image
            })
        }).resume()
    }
}