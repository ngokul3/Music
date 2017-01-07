//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true


print (33)



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
    
    
}



//let TopAppURL = "https://itunes.apple.com/search?term=tom+waits"


//et remoteURL = NSURL(string: TopAppURL)!



// Remove all the menu items before preloading
//     removeData(

/*



    let TopAppURL = "https://itunes.apple.com/search?term=tom+waits"
    
    let encoding = String.Encoding.utf8
 //   let remoteURL = NSURL(string: TopAppURL)!
    
    let contentsOfURL  = NSURL(string: TopAppURL)!
    // let dateFormatter = NSDateFormatter()
    //dateFormatter.dateFormat = "hh:mm"
    
    let delimiter = ","
    
    do {
        let content = try String(contentsOf: contentsOfURL as URL, encoding: encoding)
        
       // print(content)
        //stopItems = []
        let lines:[String] = content.components(separatedBy: CharacterSet.newlines) as [String]
        
        //print(lines.count)
        for line in lines {
            
            print(line)
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
                    print(values)
                    
                }
                
                // Put the values into the tuple and add it to the items array
                

                
            }
        }
        
        
        
    } catch {
        print(error)
    }
    

*/

/*
func parseCSV (contentsOfURL: NSURL, encoding: String.Encoding, error: NSErrorPointer) -> [(name:String, detail:String, price: String)]? {
    // Load the CSV file and parse it
    let delimiter = ","
    var items:[(name:String, detail:String, price: String)]?
    
    if let content = String(contentsOfURL: contentsOfURL, encoding: encoding, error: error) {
        items = []
        let lines:[String] = content.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet()) as [String]
        
        for line in lines {
            var values:[String] = []
            if line != "" {
                // For a line with double quotes
                // we use NSScanner to perform the parsing
                if line.rangeOfString("\"") != nil {
                    var textToScan:String = line
                    var value:NSString?
                    var textScanner:NSScanner = NSScanner(string: textToScan)
                    while textScanner.string != "" {
                        
                        if (textScanner.string as NSString).substringToIndex(1) == "\"" {
                            textScanner.scanLocation += 1
                            textScanner.scanUpToString("\"", intoString: &value)
                            textScanner.scanLocation += 1
                        } else {
                            textScanner.scanUpToString(delimiter, intoString: &value)
                        }
                        
                        // Store the value into the values array
                        values.append(value as! String)
                        
                        // Retrieve the unscanned remainder of the string
                        if textScanner.scanLocation < count(textScanner.string) {
                            textToScan = (textScanner.string as NSString).substringFromIndex(textScanner.scanLocation + 1)
                        } else {
                            textToScan = ""
                        }
                        textScanner = NSScanner(string: textToScan)
                    }
                    
                    // For a line without double quotes, we can simply separate the string
                    // by using the delimiter (e.g. comma)
                } else  {
                    values = line.componentsSeparatedByString(delimiter)
                }
                
                // Put the values into the tuple and add it to the items array
                let item = (name: values[0], detail: values[1], price: values[2])
                items?.append(item)
            }
        }
    }
    
    return items
}

*/

let requestURL: NSURL = NSURL(string: "https://itunes.apple.com/search?term=tom+waits")!
let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: requestURL as URL)
let session = URLSession.shared

print(23)





let task = session.dataTask(with: urlRequest as URLRequest) {
    (data, response, error) -> Void in
    
    let httpResponse = response as! HTTPURLResponse
    let statusCode = httpResponse.statusCode
    
    print(1)
    
    
    if let json = try? JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String:AnyObject] {
        
        for case let result in (json["results"] as? [[String: AnyObject]])!  {
             let name = result["previewUrl"] as! String
            
            print(name)
            
        }
    }
    
}

task.resume()
 




