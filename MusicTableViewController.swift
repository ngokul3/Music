//
//  MusicTableViewController.swift
//  MusicSearch
//
//  Created by Gokula K Narasimhan on 1/7/17.
//  Copyright © 2017 Gokula K Narasimhan. All rights reserved.
//

import UIKit

class MusicTableViewController: UITableViewController {

    @IBOutlet var MusicTableView: UITableView!
    
     var arrayTracks = [Track]()
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

   
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let recordCount = arrayTracks.count
        return recordCount
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        
        let cellIdentifier = "trackSignCell"
        
        let track = arrayTracks[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath as IndexPath) as! TrackViewCell
        
        cell.lblArtist.text = track.ArtistName?.description
        cell.lblTrack.text = track.TrackName?.description
    //cell.lblCollection.text = track.CollectionName?.description
        
        
        
        return cell
    }
    

    
    
    
    
    override func prepare(for segue: UIStoryboardSegue,
                          sender: Any?) {

        let identifier = segue.identifier
        if ( identifier == "showLyrics")
        {
        
            let lyricsProcessor = LyricsProcessor()
   
            
            if let lyricsViewController = segue.destination as? LyricsViewController{
                
                let row = tableView.indexPathForSelectedRow!.row
                let trackItem = arrayTracks[row]
                
                if let song  =  lyricsProcessor.LyricsSearch(artistItem: trackItem.ArtistName, songItem: trackItem.CollectionName)
                    
                {
                    if (trackItem.ArtistName  == nil)
                    {
                        trackItem.ArtistName = ""
                    }
                    
                    if ( trackItem.CollectionName == nil)
                    {
                        trackItem.CollectionName = ""
                    }
                    
                    if ( trackItem.TrackName == nil)
                    {
                        trackItem.TrackName = ""
                    }

                    
                    
                    if  (trackItem.CollectionPrice  == nil)
                    {
                        trackItem.CollectionPrice = 0
                    }
                    
                    
                    if (  trackItem.Currency  == nil )
                    {
                        trackItem.Currency = ""
                    }
                    
                    
                    if(  trackItem.TrackPrice  == nil )
                    {
                        trackItem.TrackPrice = 0
                    }
                    
                    if(  trackItem.Currency  == nil )
                    {
                        trackItem.Currency = ""
                    }
                    
                    if(  song.Song  == nil )
                    {
                        song.Song = ""
                    }
                    
                    if(  song.Lyrics  == nil )
                    {
                        song.Lyrics = ""
                    }
                    
                    if(  song.URL  == nil )
                    {
                        song.URL = ""
                    }
                    
                    
                    
                    

                    
                    lyricsViewController.varArtistName =   trackItem.ArtistName!
                    lyricsViewController.varCollectionName  = trackItem.CollectionName!
                    lyricsViewController.varCollectionPrice = trackItem.CollectionPrice!
                    lyricsViewController.varCurrency = trackItem.Currency!
                    lyricsViewController.varTrackPrice = trackItem.TrackPrice!
                    lyricsViewController.varTrackName = trackItem.TrackName!
                    

                    
                    lyricsViewController.varSong = song.Song!
                    
                    lyricsViewController.varLyrics = song.Lyrics!
                    
                    lyricsViewController.varLyricsURL = song.URL!
                }
            
               

                
            }
            
        }
    }
    
    
    
    
    

}
