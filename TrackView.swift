//
//  TrackView.swift
//  MusicSearch
//
//  Created by Gokula K Narasimhan on 1/8/17.
//  Copyright © 2017 Gokula K Narasimhan. All rights reserved.
//

import UIKit



weak var lblTrack: UILabel!


class TrackViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTrack: UILabel!
    @IBOutlet weak var lblArtist: UILabel!
    
    
    /*
     
     I can customize the cell with images. At the moment, I'm only showing 2 records (Track and Artist) tue to time senstivity.
     
     
     */
  //  @IBOutlet weak var lblCollection: UILabel!
 //   @IBOutlet weak var lblFilingStatus: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
