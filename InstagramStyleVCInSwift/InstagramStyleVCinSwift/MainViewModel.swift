//
//  MainViewModel.swift
//  InstagramStyleVCinSwift
//
//  Created by chris davis on 8/1/19.
//  Copyright © 2019 chris davis. All rights reserved.
//

import Foundation
import UIKit

enum MainViewItemType {
    case story
    case feed
}

protocol MainViewItem{
    var type: MainViewItemType {get}
    var feed: Feed {get set}
}

class MainViewModel: NSObject {
    
    var items = [MainViewItem]()
    var mainTableView: UITableView?
    
    init(_ tv: UITableView) {
        super.init()
        mainTableView = tv
        
        setup()
    }
    
    fileprivate func setup(){
        let storyItem = MainViewStoryItem()
        
        let firstFeedItem = MainViewFeedItem()
        firstFeedItem.feed = Feed("BaileyByron", 1, "sample message text \nsample message text sample message text sample message text sample message text sample message text")
        let secondFeedItem = MainViewFeedItem()
        secondFeedItem.feed = Feed("grayWill39", 2, "sample message text \nsample message text sample message text sample message text sample message text sample message text")
        let thirdFeedItem = MainViewFeedItem()
        thirdFeedItem.feed = Feed("rivasCJana", 3, "sample message text \nsample message text sample message text sample message text sample message text sample message text")
        let fourthFeedItem = MainViewFeedItem()
        fourthFeedItem.feed = Feed("TameraMitchell", 4, "sample message text \nsample message text sample message text sample message text sample message text sample message text")
        let fifthFeedItem = MainViewFeedItem()
        fifthFeedItem.feed = Feed("vivianD", 5, "sample message text \nsample message text sample message text sample message text sample message text sample message text")
        let sixthFeedItem = MainViewFeedItem()
        sixthFeedItem.feed = Feed("hensonIrma", 6, "sample message text \nsample message text sample message text sample message text sample message text sample message text")
        
        items.append(storyItem)
        items.append(firstFeedItem)
        items.append(secondFeedItem)
        items.append(thirdFeedItem)
        items.append(fourthFeedItem)
        items.append(fifthFeedItem)
        items.append(sixthFeedItem)
        
        DispatchQueue.main.async {
            self.mainTableView?.reloadData()
        }
        
    }
}

extension MainViewModel: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch items[indexPath.row].type {
        case .story:
            let cell = tableView.dequeueReusableCell(withIdentifier: StoryTab.identifier, for: indexPath) as! StoryTab
            return cell
        case .feed:
            let cell = tableView.dequeueReusableCell(withIdentifier: FeedCell.identifier, for: indexPath) as! FeedCell
            let feed = items[indexPath.row].feed
            cell.selectionStyle = .none
            cell.userImage.image = UIImage(named: "user_\(feed.number)")
            cell.userName.text = feed.userId
            cell.feedImage.image = UIImage(named: "image_\(feed.number)")
            cell.feedText.text = feed.message
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if items[indexPath.row].type == .story{
            return storyTabWidth
        }else{
            return UITableView.automaticDimension
        }
    }
    
    
}

class MainViewStoryItem: MainViewItem {
    private var _feed = Feed.init("nil",0,"nil")
    var feed: Feed {
        get {
            return _feed
        }
        set (newVal) {
            _feed = newVal
        }
    }
    var type: MainViewItemType{
        return .story
    }
}

class MainViewFeedItem: MainViewItem {
    private var _feed = Feed.init("nil",0,"nil")
    var feed: Feed {
        get {
            return _feed
        }
        set (newVal) {
            _feed = newVal
        }
    }
    var type: MainViewItemType{
        return .feed
    }
}


