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
        
    
 

 
      lblSOng.text = varSong
        lblLyrics.text = varLyrics
        lblLyricsURL.text = varLyricsURL
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
