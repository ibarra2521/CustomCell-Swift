//
//  ParsingHelper.swift
//  CustomCell Swift
//
//  Created by MCS on 10/28/15.
//  Copyright © 2015 Nivardo Ibarra. All rights reserved.
//

import UIKit

protocol ParsingHelperDelegate {
    func parsingHelperHelper(parsingHelper: ParsingHelper, didParseMoviesItem movieItem: Movie)
}

class ParsingHelper: NSObject {
    var delegate: ParsingHelperDelegate?
    
    // Parse Data
    func parseData(data: NSData) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            do {
                let infoDictonary = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                
                let responseData: NSArray = infoDictonary.valueForKey("movies") as! NSArray
                //print("responseData: %@", responseData);
                for currentMovie in responseData {
                    let cMovie: NSDictionary = currentMovie as!NSDictionary;
                    let movie : Movie
                    let image : String
                    let title : String
                    let synopsis: String
                    
                    image = cMovie.valueForKey("posters")?.valueForKey("thumbnail") as!String
                    title = cMovie.valueForKey("title") as!String
                    synopsis = cMovie.valueForKey("synopsis") as!String
                    movie = Movie(title: title, synopsis: synopsis, imageUrl: image)
                    
                    dispatch_async(dispatch_get_main_queue(),{
                        self.delegate!.parsingHelperHelper(self, didParseMoviesItem: movie);
                    });
                }
                
                
                
                
            } catch {
                // Handle exception
            }
        });
    }
}
