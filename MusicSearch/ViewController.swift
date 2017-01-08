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
        
           }
    
    @IBOutlet weak var txtSearchItem: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            // viewController1.distinctTripHeadSign = setTripHeadSign
            self.addChildViewController(viewController1)
        }
        
        
    }
    
    
    
    
    

}

