//
//  Feed.swift
//  InstagramStyleVCinSwift
//
//  Created by chris davis on 8/1/19.
//  Copyright © 2019 chris davis. All rights reserved.
//

import Foundation

class Feed: NSObject{
    
    var userId: String
    var number: Int
    var message: String
    
    init(_ id: String, _ num: Int, _ mes: String) {
        userId = id
        number = num
        message = mes
    }
    
}
