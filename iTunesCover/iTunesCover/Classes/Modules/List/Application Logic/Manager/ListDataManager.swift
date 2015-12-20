//
//  ListDataManager.swift
//  iTunesCover
//
//  Created by Quentin Metzler on 20/12/15.
//  Copyright © 2015 LocalFitness. All rights reserved.
//

import Foundation

class ListDataManager : NSObject {
    var data: NSMutableData = NSMutableData()
    
    func searchItunesForAlbums(completion: (NSDictionary? -> Void)!) {
        let urlPath = Constants.iTunesUrls.urlTop50
        let url: NSURL = NSURL(string: urlPath)!
        let request: NSURLRequest = NSURLRequest(URL: url)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request){
            (data, response, error) -> Void in
            if error != nil {
                completion(nil)
            } else {
                // Convert the retrieved data in to an object through JSON deserialization
                do {
                    let jsonResult: NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    completion(jsonResult)
                } catch _ {
                    // Now send the JSON result to our delegate object
                    completion(nil)
                }
            }
        }
        task.resume()
    }
}