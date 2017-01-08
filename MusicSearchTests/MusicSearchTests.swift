//
//  MusicSearchTests.swift
//  MusicSearchTests
//
//  Created by Gokula K Narasimhan on 1/7/17.
//  Copyright © 2017 Gokula K Narasimhan. All rights reserved.
//

import XCTest
@testable import MusicSearch

class MusicSearchTests: XCTestCase {
    var lstTrack = [Track]()
    
    
    override func setUp() {
        super.setUp()
        
        
        let track1 = Track()
        
        track1.ArtistName = "AN1"
        track1.CollectionName = "CN1"
        track1.TrackName = "TN1"
        lstTrack.append(track1)
        
        let track2 = Track()
        
        track2.ArtistName = "AN1"
        track2.CollectionName = "CN1"
        track2.TrackName = "TN2"
        lstTrack.append(track2)
        
        let track3 = Track()
        
        track3.ArtistName = "AN1"
        track3.CollectionName = "CN1"
        track3.TrackName = "TN3"
        lstTrack.append(track3)
        
        
        let track4 = Track()
        
        track4.ArtistName = "AN2"
        track4.CollectionName = "CN1"
        track4.TrackName = "TN1"
        lstTrack.append(track4)
        
        
        let track5 = Track()
        
        track5.ArtistName = "AN2"
        track5.CollectionName = "CN1"
        track5.TrackName = "TN2"
        lstTrack.append(track5)
        
        
        let track6 = Track()
        
        track6.ArtistName = "AN2"
        track5.CollectionName = "CN2"
        track6.TrackName = "TN3"
        lstTrack.append(track6)
        
        
        let track7 = Track()
        
        track7.ArtistName = "AN3"
        track7.CollectionName = "CN3"
        track7.TrackName = "TN1"
        lstTrack.append(track7)
       
        
        
        let track8 = Track()
        
        track8.ArtistName = "AN3"
        track8.CollectionName = "CN3"
        track8.TrackName = "TN1"
        lstTrack.append(track8)
       
        
        
        let track9 = Track()
        
        track9.ArtistName = "AN4"
        track9.CollectionName = "CN1"
        track9.TrackName = "TN1"
        lstTrack.append(track9)
        
        
        let track10 = Track()
        
        track10.ArtistName = "AN4"
        track10.CollectionName = "CN5"
        track10.TrackName = "TN5"
        lstTrack.append(track10)
        
        
        let track11 = Track()
        
        track11.ArtistName = "AN9"
        track11.CollectionName = "CN5"
        track11.TrackName = "TN5"
        lstTrack.append(track11)
        
        
        let track12 = Track()
        
        track12.ArtistName = "AN10"
        track12.CollectionName = "CN7"
        track12.TrackName = "TN8"
        lstTrack.append(track12)
        
        
    }
    
    func testSearchMusicProcessor()
    {
        MusicDataManager.sharedTransitInstance.TrackList = lstTrack
        
        let processor = MusicDataProcessor()
        let tracks = processor.ProcessMusicSearch(searchableEntity: "ArtistName", searchItem: "AN1")
        
        XCTAssertEqual(tracks?.count, 3)
        
        
        let tracks2 = processor.ProcessMusicSearch(searchableEntity: "CollectionName", searchItem: "CN5")
        
        XCTAssertEqual(tracks2?.count, 2)
        
        
        let tracks3 = processor.ProcessMusicSearch(searchableEntity: "TrackName", searchItem: "TN12")
        
        XCTAssertEqual(tracks3?.count, 0)
        
        
        let tracks4 = processor.ProcessMusicSearch(searchableEntity: "TrackName", searchItem: "TN8")
        
        XCTAssertEqual(tracks4?.count, 1)
        
    }
    
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
