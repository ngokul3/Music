//
//  LyricsViewController.swift
//  MusicSearch
//
//  Created by Gokula K Narasimhan on 1/8/17.
//  Copyright © 2017 Gokula K Narasimhan. All rights reserved.
//

import UIKit

class LyricsViewController: UIViewController {

    @IBOutlet weak var lblLyricsURL: UILabel!
    @IBOutlet weak var lblLyrics: UILabel!
    @IBOutlet weak var lblCollectionPrice: UILabel!
    @IBOutlet weak var lblCollectionName: UILabel!
    @IBOutlet weak var lblTrackPrice: UILabel!
    @IBOutlet weak var lblSOng: UILabel!
    @IBOutlet weak var lblArtisName: UILabel!
    
    @IBOutlet weak var lblTrackName: UILabel!
    @IBAction func btnexitclick(_ sender: Any) {
        
        
        /*
         
         I can implement proper navigation contol between View Controllers.
         
         Due to limited time, I'm just dismissing the last opened View Controller.
         
         
         */
        self.dismiss(animated: false, completion: nil)
     //   self.performSegue(withIdentifier: "backtomusic", sender: nil)
        
    }
    @IBOutlet weak var btnexit: UIButton!
    
    @IBOutlet weak var lblCurrency: UILabel!
    
    var varLyrics = String()
    var varLyricsURL = String()
    var varCollectionPrice = Double()
    var varCollectionName = String()
    var varTrackName = String()
    var varTrackPrice = Double()
    var varArtistName = String()
    var varCurrency = String()
    
    var varSong = String()
    
    
    
    
    var track = Track()
    var song = Song()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        lblArtisName.text = varArtistName
        
        lblCollectionName.text = varCollectionName
        lblCollectionPrice.text = varCollectionPrice.description
        lblCurrency.text = varCurrency
        lblTrackPrice.text = varTrackPrice.description
        lblTrackName.text   = varTrackName.description
    
 

 
      lblSOng.text = varSong
        lblLyrics.text = varLyrics
        
        
        
        /*
         IDeally URL should be a link to navigate.
         
         */
        lblLyricsURL.text = varLyricsURL
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func unwindToMusic(sender: UIStoryboardSegue) {
       
        }
 
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
       if let  musicTableViewController = segue.destination as? MusicTableViewController
       {musicTableViewController.view.reloadInputViews()
        
        }
        
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
