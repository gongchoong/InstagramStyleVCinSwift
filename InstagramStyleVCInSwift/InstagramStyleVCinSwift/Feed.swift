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
    var like: Int
    var comment: Comment
    
    init(_ id: String, _ num: Int, _ lk: Int, _ comm: Comment) {
        userId = id
        number = num
        like = lk
        comment = comm
    }
    
    override init() {
        userId = ""
        number = 0
        like = 0
        comment = Comment("", "")
    }
    
}
