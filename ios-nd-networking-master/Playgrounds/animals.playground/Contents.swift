//
//  animals.playground
//  iOS Networking
//
//  Created by Jarrod Parkes on 09/30/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import Foundation

/* Path for JSON files bundled with the Playground */
var pathForAnimalsJSON = NSBundle.mainBundle().pathForResource("animals", ofType: "json")

/* Raw JSON data (...simliar to the format you might receive from the network) */
var rawAnimalsJSON = NSData(contentsOfFile: pathForAnimalsJSON!)

/* Error object */
var parsingAnimalsError: NSError? = nil

/* Parse the data into usable form */
var parsedAnimalsJSON = try! NSJSONSerialization.JSONObjectWithData(rawAnimalsJSON!, options: .AllowFragments) as! NSDictionary

func parseJSONAsDictionary(dictionary: NSDictionary) {
    guard let photoDictionary = parsedAnimalsJSON["photos"] as? NSDictionary else {
        print("No key found for photo")
        return
    }
    
    guard let totalPhotos = photoDictionary["total"] as? Int else {
        print("no key found for 'total'")
        return
    }
    
    guard let arrayOfPhotoDictionaries = photoDictionary["photo"] as? [[String:AnyObject]] else{
        print("No key photo found")
        return
    }
    print("Total = \(totalPhotos)")
    
    for(index, photo) in arrayOfPhotoDictionaries.enumerate() {
        guard let commentDictionary = photo["comment"] as? [String:AnyObject] else{
            print("No key found under comment")
            return
        }
        guard let comment = commentDictionary["_content"] as? String else {
            print("No key found under _content")
            return
        }
        if comment.rangeOfString("interrufftion") != nil {
            print(index)
        }
        
        if let photoURL = photo["url_m"] as? String where index == 2{
            print(photoURL)
        }
        
    }
}

parseJSONAsDictionary(parsedAnimalsJSON)
