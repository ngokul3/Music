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
       // let ss = searchItem.
        
        let searchItem = searchItem?.uppercased()
        
       
        guard  searchItem  != nil else
        {
            return lstTrack
        }
        
        
        if(lstTrack.count == 0)
        {
            return nil
        }
        
        let artistNameCount = lstTrack.filter{($0.ArtistName?.uppercased().contains(searchItem!))!}
        let trackCount = lstTrack.filter{($0.TrackName?.uppercased().contains(searchItem!))!}
        
        
        if artistNameCount.count > 0 {
 
            lstTrack = lstTrack.filter{($0.ArtistName?.uppercased().contains(searchItem!))!}
            
            }

            
        else  if trackCount.count > 0 {
            
            lstTrack = lstTrack.filter{($0.TrackName?.uppercased().contains(searchItem!))!}
            
        }
        else{
            return lstTrack
        }
        
                return lstTrack
    }
    
    
}
