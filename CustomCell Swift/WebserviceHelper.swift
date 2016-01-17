//
//  WebserviceHelper.swift
//  CustomCell Swift
//
//  Created by MCS on 10/28/15.
//  Copyright © 2015 Nivardo Ibarra. All rights reserved.
//

import Foundation

import Foundation

let URL_STRING = "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=s9gd3xzejzsyjzrj5zfu3d6a"

protocol WebserviceHelperDelegate {
    func webserviceHelper (webserviceHelper:WebserviceHelper, didDownloadMovie movieItem: Movie);
}


class WebserviceHelper: NSObject, ParsingHelperDelegate {
    
    var delegate: WebserviceHelperDelegate?;
    var parsingHelper = ParsingHelper();
    
    override init() {
        super.init();
        parsingHelper.delegate = self;
    }
    
    //Dowload data from the URL
    func loadDataFromWebService () {
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: URL_STRING)
        
        let task = session.dataTaskWithURL(url!) {
            (data, response, error) -> Void in
            
            if error != nil {
                print(error!.localizedDescription)
            }
            else {
                self.parsingHelper.parseData(data!);
            }
        }
        
        task.resume()
    }
    
    func parsingHelperHelper(parsingHelper: ParsingHelper, didParseMoviesItem movieItem: Movie) {
        self.delegate?.webserviceHelper(self, didDownloadMovie: movieItem)
    }
    
}