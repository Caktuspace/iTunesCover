//
//  iTunesCoverTests.swift
//  iTunesCoverTests
//
//  Created by Quentin Metzler on 20/12/15.
//  Copyright © 2015 LocalFitness. All rights reserved.
//

import XCTest
@testable import iTunesCover

class iTunesCoverTests: XCTestCase {
    
    var dataManager = ListDataManager()
    var listIterator : ListInteractor?
    
    override func setUp() {
        super.setUp()
        listIterator = ListInteractor(dataManager: dataManager)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testQueryResult() {
        let expectation = self.expectationWithDescription("Testing iTunes Query")
        dataManager.searchItunesForAlbums { (dico : NSDictionary?) -> Void in
            XCTAssertNotNil(dico, "iTunes query should return a dictionary")
            let feed = dico!["feed"] as? NSDictionary
            XCTAssertNotNil(feed, "iTunes query feed should contain a dictionary")
            let entry = feed!["entry"] as? NSArray
            XCTAssertNotNil(entry, "iTunes query entry should contain an array")
            XCTAssertEqual(entry!.count, 50, "iTunes query should return 50 albums")
            let albums = self.listIterator!.albumsFromCovers(dico!)
            let collection = AlbumDisplayDataCollection()
            collection.addAlbums(albums)
            let sortedAlbums = collection.collectedDisplayData().items
            let prevAlbum = sortedAlbums[0]
            for album in sortedAlbums {
                if prevAlbum.album.title > album.album.title {
                    XCTAssert(false, "Albums should be ordered by title alphabetically")
                }
            }
            expectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5.0) { (error : NSError?) -> Void in
            if let error = error {
                XCTFail(String("Expectation Failed with error: %@", error));
            }
        }
    }
    
    func testVisual() {
        
    }
    
    func testPerformance() {
        self.measureBlock {
            self.listIterator!.findAlbums()
        }
    }
    
}
