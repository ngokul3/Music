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
    var trackURL : String { return  "https://itunes.apple.com/search?term=tom+waits"}
    
    
    func LoadTrack(completion: @escaping ([Track]) -> Void)
    {
    
    let requestURL: NSURL = NSURL(string: trackURL)!
    let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: requestURL as URL)
    let session = URLSession.shared

    
    let task = session.dataTask(with: urlRequest as URLRequest) {
    (data, response, error) -> Void in
    
     
    var lstTrack: [Track] = []
    
    
    if let json = try? JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String:AnyObject] {
    
    for case let result in (json["results"] as? [[String: AnyObject]])!  {
        
        
        if let track = try? Track(json: result) {
                        lstTrack.append(track)
                    }
        }
        completion(lstTrack)

        
        }
        
    }
    
    task.resume()
    
    
    }
    
}
