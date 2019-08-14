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
        firstFeedItem.feed = Feed("firstName")
        let secondFeedItem = MainViewFeedItem()
        secondFeedItem.feed = Feed("secondName")
        
        items.append(storyItem)
        items.append(firstFeedItem)
        items.append(secondFeedItem)
        
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
            let cell = UITableViewCell()
            cell.backgroundColor = UIColor.red
            cell.textLabel?.text = items[indexPath.row].feed.name
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch items[indexPath.row].type {
        case .story:
            return screenWidth*0.25
        case .feed:
            return screenHeight*0.7
        }
    }
    
    
}

class MainViewStoryItem: MainViewItem {
    private var _feed = Feed.init("nil")
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
    private var _feed = Feed.init("nil")
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


