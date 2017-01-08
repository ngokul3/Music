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
func parseCSV (_ contentsOfURL: URL, encoding: String.Encoding) -> [(stopID:String, stopCode:String, stopName: String)]? {
    
    // Load the CSV file and parse it
    let delimiter = ","
    var items:[(stopID:String, stopCode:String, stopName: String)]?
    
    do {
        let content = try String(contentsOf: contentsOfURL, encoding: encoding)
        
        
        print(encoding)
        
        items = []
        let lines:[String] = content.components(separatedBy: CharacterSet.newlines) as [String]
        
        print(lines)
        /*
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
                
                // Put the values into the tuple and add it to the items array
                let item = (stopID: values[0], stopCode: values[1], stopName: values[2])
                items?.append(item)
            }
        }
        
        */
 
        //existing code
        //}
        //}
        
        
        
        
    } catch {
        print(error)
    }
    
    return items
}


let requestURL: NSURL = NSURL(string: "https://itunes.apple.com/search?term=tom+waits")!
let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: requestURL as URL)

let session = URLSession.shared


//print(23)


let lyricsURL: NSURL = NSURL(string: "http://lyrics.wikia.com/api.php?func=getSong&artist=Tom+Waits&song=new+coat+of+paint&fmt=json")!
let lyricsURLRequest:  NSMutableURLRequest = NSMutableURLRequest(url: lyricsURL as URL)



let _ = parseCSV(lyricsURL as URL, encoding: String.Encoding.utf8)


let task = session.dataTask(with: urlRequest as URLRequest) {
    (data, response, error) -> Void in
    
    let httpResponse = response as! HTTPURLResponse
    let statusCode = httpResponse.statusCode
    
   // print(1)
    
    
    if let json = try? JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String:AnyObject] {
        
        for case let result in (json["results"] as? [[String: AnyObject]])!  {
             let name = result["previewUrl"] as! String
            
           /// print(name)
            
        }
    }
    
}

task.resume()
 

 




