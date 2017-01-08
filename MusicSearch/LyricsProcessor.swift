//
//  LyricsProcessor.swift
//  MusicSearch
//
//  Created by Gokula K Narasimhan on 1/8/17.
//  Copyright © 2017 Gokula K Narasimhan. All rights reserved.
//

import Foundation

class LyricsProcessor
{
    func LyricsSearch(artistItem: String?, songItem: String?) -> Song?
    {
       
        let song = MusicDataManager.sharedTransitInstance.SongList
        
        guard  artistItem  != nil else
        {
            return nil
        }
        
        
        guard  songItem  != nil else
        {
            return nil
        }
        
        if let filteredSong = song.filter({$0.Artist?.lowercased() == artistItem?.lowercased() && $0.Song?.lowercased() == songItem?.lowercased()}).first
        {
            return filteredSong
            
        }
        
        else
        {
            //The provided URL does not have any filtered song to return
            
            //For display purpose, returning the only default record.
            return song.first
        }
        
        
        
    }
}
