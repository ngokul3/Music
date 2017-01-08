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
    var lstSong = [Song]()
    
    
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
        
        track10.ArtistName = "ANT4"
        track10.CollectionName = "CN5"
        track10.TrackName = "TN5"
        lstTrack.append(track10)
        
        
        let track11 = Track()
        
        track11.ArtistName = "AN19"
        track11.CollectionName = "CN5"
        track11.TrackName = "TN85"
        lstTrack.append(track11)
        
        
        let track12 = Track()
        
        track12.ArtistName = "AN10"
        track12.CollectionName = "CN57"
        track12.TrackName = "TN8"
        lstTrack.append(track12)
        
        
        
        let song1 = Song()
        
        song1.Artist = "AN9"
        song1.Song = "FD"
        lstSong.append(song1)
        
        let song2 = Song()
        
        song2.Artist = "AN10"
        song2.Song = "CN57"
        lstSong.append(song2)
        
        
        let song3 = Song()
        
        song3.Artist = "ANT4"
        song3.Song = "CN5"
        lstSong.append(song3)
        
        let song4 = Song()
        
        song4.Artist = "ANT4"
        song4.Song = "CN5"
        lstSong.append(song4)

        
        
        
        
        
        
    }
    
    func testSearchMusicProcessor()
    {
        MusicDataManager.sharedTransitInstance.TrackList = lstTrack
        
        let processor = MusicDataProcessor()
        let tracks = processor.ProcessMusicSearch( searchItem: "AN1")
        
        XCTAssertEqual(tracks?.count, 5)
        
        
        if let _ = processor.ProcessMusicSearch( searchItem: "CN5")
        {
             XCTAssert(false)
        }
        else
        {
             XCTAssert(true)
        }
        
        let tracks3 = processor.ProcessMusicSearch(searchItem: "T")
        
        XCTAssertEqual(tracks3?.count,1 )
        
        
        let tracks4 = processor.ProcessMusicSearch(searchItem: "TN8")
        
        XCTAssertEqual(tracks4?.count, 2)
        
        
        
        
    }
    
    func testSearchLyricsProcessor()
    {
        MusicDataManager.sharedTransitInstance.SongList = lstSong
    
       
        
        let processor = LyricsProcessor()
        if let _ = processor.LyricsSearch(artistItem: "AN19", songItem: "FD3")
        {
             XCTAssert(false)
        }
        else
        {
             XCTAssert(true)
        }
     
        
        let song2 = processor.LyricsSearch(artistItem: "AN10", songItem: "CN57")
        
        
        XCTAssertEqual(song2?.Artist,"AN10")
         XCTAssertEqual(song2?.Song,"CN57")
        
        let song3 = processor.LyricsSearch(artistItem: "ANT4", songItem: "CN5")
        
        
        XCTAssertEqual(song3?.Artist,"ANT4")
        XCTAssertEqual(song3?.Song,"CN5")


        
        
        

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
