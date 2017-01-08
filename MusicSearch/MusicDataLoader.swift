//
//  MusicDataLoader.swift
//  MusicSearch
//
//  Created by Gokula K Narasimhan on 1/7/17.
//  Copyright © 2017 Gokula K Narasimhan. All rights reserved.
//

import Foundation

class MusicDataLoader
{
    let trackURL =  "https://itunes.apple.com/search?term=tom+waits"
    let lyricsURL: NSURL = NSURL(string: "http://lyrics.wikia.com/api.php?func=getSong&artist=Tom+Waits&song=new+coat+of+paint&fmt=json")!
  
    private var lstTrack: [Track] = []
    private var lstSong: [Song] = []
    
    var SongList : [Song]
        {
        get
        {
            if ( lstSong.count == 0)
            {
                if let items = parseCSV(lyricsURL as URL, encoding: String.Encoding.utf8)
                {
                    var song = Song()
                    
                    for item in  items{
                        
                        switch item.ItemKey
                        {
                        case "artist":
                        song.Artist = item.ItemValue
                        
                        case "song":
                        
                            song.Song = item.ItemValue
                        case "lyrics":
                            
                            song.Lyrics = item.ItemValue
                        
                        case "url":
                            
                            song.URL = item.ItemValue
                        
                        case "NextRecord":
                            lstSong.append(song)
                            song = Song()
                        default:
                            break
                        }
                       
                        
                    }
                   
                }

            }
            return lstSong
        }
        
        set(songs) {
            lstSong = songs
            
        }
        
    }
    
    
    var TrackList : [Track]
        {
        get
        {
            if ( lstTrack.count == 0)
            {
                LoadTrack(){
                    tracks in
                    self.lstTrack = tracks
                }
            }
            return lstTrack
        }
        
        set(tracks) {
            lstTrack = tracks
            
        }
        
    }
    
   private func LoadTrack(completion: @escaping ([Track]) -> Void)
    {
    
    let requestURL: NSURL = NSURL(string: trackURL)!
    let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: requestURL as URL)
    let session = URLSession.shared

    
    let task = session.dataTask(with: urlRequest as URLRequest) {
    (data, response, error) -> Void in
    
     
    
    
    if let json = try? JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String:AnyObject] {
    
    for case let result in (json["results"] as? [[String: AnyObject]])!  {
        
        
        if let track = try? Track(json: result) {
                        self.lstTrack.append(track)
                    }
        }
        completion(self.lstTrack)

        
        }
        
    }
    
    task.resume()
    
    
    }
    
    
    func parseCSV (_ contentsOfURL: URL, encoding: String.Encoding) -> [(ItemKey:String, ItemValue:String)]? {
        
        // Load the CSV file and parse it
        let delimiter = "':"
        
        print(encoding)
        
        
        var items:[(ItemKey:String, ItemValue:String)]?
        
        do {
            
            let content = try String(contentsOf: contentsOfURL, encoding: encoding)
            
            
            print(content)
            
            items = []
            var lines:[String] = content.components(separatedBy: CharacterSet.newlines) as [String]
            
            
            
            
          //  lines.remove
            
             for line in lines {
             var values:[String] = []
             if line != "" {
             // For a line with double quotes
             // we use NSScanner to perform the parsing
             if line.range(of: "\"") != nil {
             var textToScan:String = line
             var value:NSString?
             var textScanner:Scanner = Scanner(string: textToScan)
             while textScanner.string != "" {
             
             if (textScanner.string as NSString).substring(to: 1) == "\"" {
             textScanner.scanLocation += 1
             textScanner.scanUpTo("\"", into: &value)
             textScanner.scanLocation += 1
             } else {
             textScanner.scanUpTo(delimiter, into: &value)
             }
             
             // Store the value into the values array
             values.append(value as! String)
             
             // Retrieve the unscanned remainder of the string
             if textScanner.scanLocation < textScanner.string.characters.count {
             textToScan = (textScanner.string as NSString).substring(from: textScanner.scanLocation + 1)
             } else {
             textToScan = ""
             }
             textScanner = Scanner(string: textToScan)
             }
             
             // For a line without double quotes, we can simply separate the string
             // by using the delimiter (e.g. comma)
             } else  {
             
             
             values = line.components(separatedBy: delimiter)
             }
             
                if (values.count == 2 )
                {
                    let item = (ItemKey: values[0].replacingOccurrences(of: "\'", with: ""), ItemValue: values[1].replacingOccurrences(of: "\'", with: "").replacingOccurrences(of: ",", with: ""))
                    items?.append(item)
                    }
                }
                else if(items?.count != 0){
                let item = (ItemKey: "NextRecord", ItemValue: "NextRecord")
                items?.append(item)
                }
            }
            
             
 
            //existing code
            //}
            //}
            
            
            
            
        } catch {
            print(error)
        }
        
        return items
    }

    
}
