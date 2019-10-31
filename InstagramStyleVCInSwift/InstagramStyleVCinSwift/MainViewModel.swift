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
        firstFeedItem.feed = Feed("BaileyByron", 1, 37, Comment("rivasCJana", "sample message text \nsample message text sample message text sample message text sample message text sample message text"))
        let secondFeedItem = MainViewFeedItem()
        secondFeedItem.feed = Feed("grayWill39", 2, 193, Comment("hensonIrma", "sample message text \nsample message text sample message text sample message text sample message text sample message text"))
        let thirdFeedItem = MainViewFeedItem()
        thirdFeedItem.feed = Feed("rivasCJana", 3, 87, Comment("TameraMitchell", "sample message text \nsample message text sample message text sample message text sample message text sample message text"))
        let fourthFeedItem = MainViewFeedItem()
        fourthFeedItem.feed = Feed("TameraMitchell", 4, 234, Comment("grayWill39", "sample message text \nsample message text sample message text sample message text sample message text sample message text"))
        let fifthFeedItem = MainViewFeedItem()
        fifthFeedItem.feed = Feed("vivianD", 5, 19, Comment("BaileyByron", "sample message text \nsample message text sample message text sample message text sample message text sample message text"))
        let sixthFeedItem = MainViewFeedItem()
        sixthFeedItem.feed = Feed("hensonIrma", 6, 78, Comment("vivianD", "sample message text \nsample message text sample message text sample message text sample message text sample message text"))
        
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
            cell.likeLabel.text = "\(feed.like) likes"
            let attributedText = NSMutableAttributedString()
            attributedText.bold(feed.comment.userId).normal(feed.comment.text)
            cell.feedText.text = attributedText.string
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

extension NSMutableAttributedString {
    @discardableResult func bold(_ text: String) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: 16)]
        let boldString = NSMutableAttributedString(string:text, attributes: attrs)
        append(boldString)
        
        return self
    }
    
    @discardableResult func normal(_ text: String) -> NSMutableAttributedString {
        let normal = NSAttributedString(string: text)
        append(NSAttributedString(string: " "))
        append(normal)
        
        return self
    }
}

class MainViewStoryItem: MainViewItem {
    private var _feed = Feed()
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
    private var _feed = Feed()
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


