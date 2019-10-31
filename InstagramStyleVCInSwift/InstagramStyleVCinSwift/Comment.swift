//
//  Comment.swift
//  InstagramStyleVCinSwift
//
//  Created by chris davis on 8/23/19.
//  Copyright © 2019 chris davis. All rights reserved.
//

import Foundation

class Comment: NSObject {
    var userId: String
    var text: String
    
    init(_ id: String, _ txt: String) {
        userId = id
        text = txt
    }
}
