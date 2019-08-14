//
//  User.swift
//  InstagramStyleVCinSwift
//
//  Created by chris davis on 8/14/19.
//  Copyright © 2019 chris davis. All rights reserved.
//

import Foundation

class User: NSObject {
    let name: String
    let imageNum: Int
    
    init(_ _name: String, _ num: Int) {
        name = _name
        imageNum = num
    }
}
