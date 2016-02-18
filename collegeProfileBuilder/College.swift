//
//  College.swift
//  collegeProfileBuilder
//
//  Created by VLindsey on 1/25/16.
//  Copyright © 2016 Valerie. All rights reserved.
//

import UIKit

class College: NSObject
{
    var name = ""
    var location = ""
    var numOfStudents = 0
    var image = UIImage(named: "default")
    var webPage = "" 
    
    init (Name: String, Location: String, NumOfStudents: Int, Image: UIImage, WebPage: String)
    {
        super.init()
        name = Name
        location = Location
        numOfStudents = NumOfStudents
        image = Image
        webPage = WebPage
    }
    
    init(Name: String, Location: String, NumOfStudents: Int)
    {
        super.init()
        name = Name
        location = Location
        numOfStudents = NumOfStudents
    }
    
}
