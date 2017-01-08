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
    func ProcessMusicSearch(searchableEntity: String?, searchItem: String?)->[Track]?
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
        case SearchableMusicEntity.ArtistName.description:
            lstTrack = lstTrack.filter({$0.ArtistName == searchItem})
            
            
        case SearchableMusicEntity.CollectionName.description:
            
            lstTrack = lstTrack.filter({$0.CollectionName == searchItem})
            
        case SearchableMusicEntity.TrackName.description:
            
            
            lstTrack = lstTrack.filter({$0.TrackName == searchItem})
            
        default:
            break
        }
        
        return lstTrack
    }
}
