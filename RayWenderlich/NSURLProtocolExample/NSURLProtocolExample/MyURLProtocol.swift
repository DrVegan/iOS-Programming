//
//  MyURLProtocol.swift
//  NSURLProtocolExample
//
//  Created by Daniel Freeman on 29/06/2016.
//  Copyright © 2016 Zedenem. All rights reserved.
//

import UIKit

var requestCount = 0

class MyURLProtocol: NSURLProtocol {
    override class func canInitWithRequest(request: NSURLRequest) -> Bool {
        println("Request #\(requestCount++): URL = \(request.URL.absoluteString)")
        return false
    } 
}