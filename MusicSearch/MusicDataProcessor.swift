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
    func ProcessMusicSearch(searchItem: String?)->[Track]?
    {
        var lstTrack = MusicDataManager.sharedTransitInstance.TrackList
        
       
        guard  searchItem  != nil else
        {
            return nil
        }
        
        
        if(lstTrack.count == 0)
        {
            return nil
        }
        
        let artistNameCount = lstTrack.filter{($0.ArtistName?.contains(searchItem!))!}
        let trackCount = lstTrack.filter{($0.TrackName?.contains(searchItem!))!}
        
        
        if artistNameCount.count > 0 {
 
            lstTrack = lstTrack.filter{($0.ArtistName?.contains(searchItem!))!}
            
            }

            
        else  if trackCount.count > 0 {
            
            lstTrack = lstTrack.filter{($0.TrackName?.contains(searchItem!))!}
            
        }
        else{
            return nil
        }
        
                return lstTrack
    }
    
    
}
