//
//  Movie.swift
//  CustomCell Swift
//
//  Created by MCS on 10/28/15.
//  Copyright © 2015 Nivardo Ibarra. All rights reserved.
//

import UIKit

class Movie: NSObject {
    
    var imageUrl: String?
    var image: UIImage?
    var title: String?
    var synopsis: String?
    
    override init() {
        super.init()
    }
    
    init(title: String, synopsis: String, imageUrl: String) {
        self.title = title
        self.synopsis = synopsis
        self.imageUrl = imageUrl
    }
}
