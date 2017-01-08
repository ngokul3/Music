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
        
        let filteredSong = song.filter({$0.Artist == artistItem && $0.Song == songItem}).first
        
        
        return filteredSong
    }
}
