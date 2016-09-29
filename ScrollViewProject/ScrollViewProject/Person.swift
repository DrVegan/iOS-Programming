//
//  DataSource.swift
//  ScrollViewProject
//
//  Created by Daniel Freeman on 27/9/16.
//  Copyright © 2016 FreemanCorp. All rights reserved.
//

import Foundation
import UIKit

class Person: NSObject{
    
    var nameFirst: String
    var nameMiddle: String?
    var nameLast: String
    var age: Int?

    init(first: String, middle: String? = nil, last: String) {
        nameFirst = first
        nameMiddle = middle
        nameLast = last
    }
    
    init(first: String, last: String, myAge: Int? = nil){
        nameFirst = first
        nameLast = last
        age = myAge
    }
    
}
