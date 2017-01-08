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
    

    
    
    
    /*
    override func prepare(for segue: UIStoryboardSegue,
                          sender: Any?) {

        let identifier = segue.identifier
        if ( identifier == "showLyrics")
        {
            if (arrayTracks == nil)
            {
                return
            }
            
            if let lyricsViewController = segue.destination as? LyricsViewController{
                
                let row = tableView.indexPathForSelectedRow!.row
                let trackItem = arrayTracks[row].
                
                let trips = lstResult?.lstTrip.filter({$0.truncatedTripHeadSign == tripHeadSignItem})
                
                let stopTime = lstResult?.lstStopTime.filter{
                    
                    let x = $0.tripID
                    let y = trips?.filter({$0.tripID == x})
                    
                    if ((y?.count)! > 0)
                    {
                        return true
                    }
                    else{
                        return false
                    }
                }
                
                let stops = lstResult?.lstStop.filter{
                    let x = $0.stopID
                    let y = stopTime?.filter{$0.stopID == x}
                    
                    if ((y?.count)! > 0)
                    {
                        return true
                    }
                    else{
                        return false
                    }
                }
                //todo
                mapViewController.lstResult = TransitResult()
                mapViewController.lstResult?.lstStop = stops!
                mapViewController.lstResult?.lstStopTime = stopTime!
                mapViewController.lstResult?.lstTrip = trips!
                
            }
            
        }
    }
    */
    
    
    
    

}
