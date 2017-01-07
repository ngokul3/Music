//
//  MusicDataProcessor.swift
//  MusicSearch
//
//  Created by Gokula K Narasimhan on 1/7/17.
//  Copyright © 2017 Gokula K Narasimhan. All rights reserved.
//

import Foundation


class MusicDataProcessor
{
    func ProcessMusicSearch(searchableEntity: SearchableMusicEntity?, searchItem: String?)->[Track]?
    {
        var lstTrack = MusicDataManager.sharedTransitInstance.TrackList
        
       
        guard  searchableEntity  != nil else
        {
            return nil
        }
        
        
        
        
        if(lstTrack.count == 0)
        {
            return nil
        }
        
        switch searchableEntity!
        {
        case .ArtistName:
            lstTrack = lstTrack.filter({$0.ArtistName == searchItem})
            
            
        case .CollectionName:
            
            lstTrack = lstTrack.filter({$0.CollectionName == searchItem})
            
        case .TrackName:
            
            
            lstTrack = lstTrack.filter({$0.TrackName == searchItem})
            
       
        }
        
        return lstTrack
    }
}
