//
//  Person.swift
//  CustomCell Swift
//
//  Created by Nivardo Ibarra on 10/28/15.
//  Copyright © 2015 Nivardo Ibarra. All rights reserved.
//

import Foundation

class Person: NSObject {
    var name = "name"
    var number = 0
    var imageName = "blak"
    
    init(name: String, number: Int, imageName: String) {
        self.name = name
        self.number = number
        self.imageName = imageName
    }
}