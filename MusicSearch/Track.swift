//
//  Track.swift
//  MusicSearch
//
//  Created by Gokula K Narasimhan on 1/7/17.
//  Copyright © 2017 Gokula K Narasimhan. All rights reserved.
//

import Foundation
/*
"wrapperType":"track"
, "kind":"song"
, "artistId":83964
, "collectionId":285283129
, "trackId":285283137
, "artistName":"Tom Waits"
, "collectionName":"Closing Time"
, "trackName":"Ol' 55"
, "collectionCensoredName":"Closing Time"
, "trackCensoredName":"Ol' 55"
, "artistViewUrl":"https://itunes.apple.com/us/artist/tom-waits/id83964?uo=4"
, "collectionViewUrl":"https://itunes.apple.com/us/album/ol-55/id285283129?i=285283137&uo=4"
, "trackViewUrl":"https://itunes.apple.com/us/album/ol-55/id285283129?i=285283137&uo=4"
, "previewUrl":"http://a1800.phobos.apple.com/us/r30/Music/00/41/c8/mzm.olsebuks.aac.p.m4a"
, "artworkUrl30":"http://is3.mzstatic.com/image/thumb/Music/v4/f5/08/dd/f508ddf9-bd03-f1d5-6e57-41fc0680005a/source/30x30bb.jpg"
, "artworkUrl60":"http://is3.mzstatic.com/image/thumb/Music/v4/f5/08/dd/f508ddf9-bd03-f1d5-6e57-41fc0680005a/source/60x60bb.jpg"
, "artworkUrl100":"http://is3.mzstatic.com/image/thumb/Music/v4/f5/08/dd/f508ddf9-bd03-f1d5-6e57-41fc0680005a/source/100x100bb.jpg"
, "collectionPrice":9.99
, "trackPrice":1.29
, "releaseDate":"1990-10-16T07:00:00Z"
, "collectionExplicitness":"notExplicit"
, "trackExplicitness":"notExplicit"
, "discCount":1
, "discNumber":1
, "trackCount":12
, "trackNumber":1
, "trackTimeMillis":237467
, "country":"USA"
, "currency":"USD”
, "primaryGenreName":"Rock"
, "isStreamable":true

*/
enum MusicError: Error {
    case missing(String)
    case invalid(String, Any)
}

public enum SearchableMusicEntity {
    case ArtistName
    case TrackName
    case CollectionName
    
    var description : String {
        switch self {
            
        case .ArtistName: return "ArtistName";
        case .TrackName: return "TrackName";
        case .CollectionName: return "CollectionName";
        }
    }
    
    
   
}




class Track
{
    var WrapperType:String?
    var Kind:String?
    var ArtistId:IntMax?
    var CollectionId:IntMax?
    var TrackId:IntMax?
    var ArtistName:String?
    var CollectionName:String?
    var TrackName:String?
    var CollectioCensoredName:String?
    var TrackCensoredName:String?
    var ArtistViewURL:String?
    var CollectionViewURL:String?
    var TrackViewURL:String?
    var PreviewURL:String?
    var ArtWorkURL30:String?
    var ArtWorkURL60:String?
    var  ArtWorkURL100:String?
    var CollectionPrice:Double?
    var TrackPrice:Double?
    var ReleaseDate:Date?
    var CollectionExplicitness:String?
    var TrackExplicitness:String?
    var DiscCount:IntMax?
    var DiscNumber:IntMax?
    var TrackCount:IntMax?
    var TrackNumber:IntMax?
    var TrackTImeMillis:IntMax?
    var Country:String?
    var Currency:String?
    var PrimaryGenreName:String?
    var IsStreamable:Bool?
    
    required init()
    {
       
    }
    convenience init(json: [String: Any]) throws {
        
        self.init()
        
    
        guard (json["artistName"] as? String) != nil else {
            throw MusicError.missing("ArtistName")
        }
 
        
        
        guard (json["collectionName"] as? String) != nil else {
            throw MusicError.missing("CollectionName")
        }
    
        
        guard (json["trackName"] as? String) != nil else {
            throw MusicError.missing("TrackName")
        }
        
        
        self.WrapperType = json["wrapperType"] as? String
        self.Kind = json["kind"] as? String
        self.ArtistId = json["artistId"] as? IntMax
        self.CollectionId = json["collectionId"] as? IntMax
        self.TrackId = json["trackId"] as? IntMax

        self.ArtistName = json["artistName"] as? String

        self.CollectionName = json["collectionName"] as? String
        
        self.TrackName = json["trackName"] as? String


        
        
    }
    
    
    
    
}
