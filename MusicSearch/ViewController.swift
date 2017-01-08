//
//  ViewController.swift
//  MusicSearch
//
//  Created by Gokula K Narasimhan on 1/7/17.
//  Copyright © 2017 Gokula K Narasimhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var lstTrack = [Track]()
    
    @IBOutlet weak var btnSearc: UIButton!
    
    @IBAction func btnSearch(_ sender: Any) {
        
        let musicProcessor = MusicDataProcessor()
        
        if let tracks  =  musicProcessor.ProcessMusicSearch(searchItem: txtSearchItem.text)
        {
            lstTrack = tracks
            
            
            let containerViewController = self.childViewControllers[0] as! MusicTableViewController
            
            containerViewController.arrayTracks = lstTrack
            containerViewController.tableView.reloadData()
            
            
            
            
        }

    }
    
    /* 
     
     
     I would set up a dynamic search text control instead of button approach.
     
     As the user types in Artist names or Track name, I will populate the grid.
     
     I will eliminate button search if I have more time
     
     
     Also the Controls in STORYBOARD can be done with Auto Layout features.
     
     */
    @IBAction func btnSearch2(_ sender: Any) {
        
        
        let musicProcessor = MusicDataProcessor()
        
        if let tracks  =  musicProcessor.ProcessMusicSearch(searchItem: txtSearchItem.text)
        {
            lstTrack = tracks
            
            
            let containerViewController = self.childViewControllers[0] as! MusicTableViewController
            
            containerViewController.arrayTracks = lstTrack
            containerViewController.tableView.reloadData()
            

            
            
        }
    }
    @IBAction func txtSearchItemEndEdit(_ sender: Any) {
        
        
        /*Can implement some validation*/
           }
    
    @IBOutlet weak var txtSearchItem: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /* 
         
         Initially thought about setting a picker that will contain all searchable items like Artist names, Track Name,...etc.
         
         This was over kill and not necessary.
         
         Please ignroe the enum - SearchableMusicEntity
         
         */
        
        
      //   self.pickerData = [SearchableMusicEntity.ArtistName.description, SearchableMusicEntity.CollectionName.description, SearchableMusicEntity.TrackName.description]
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    
    
    
   
   
    
    override func prepare(for segue: UIStoryboardSegue,
                          sender: Any?) {
        
        let identifier = segue.identifier
        if ( identifier == "ShowTracks")
        {
            
            let viewController1 = segue.destination as! MusicTableViewController
            viewController1.arrayTracks = lstTrack
            
            self.addChildViewController(viewController1)
        }
        
        
    }
    
    
    
    
    

}

