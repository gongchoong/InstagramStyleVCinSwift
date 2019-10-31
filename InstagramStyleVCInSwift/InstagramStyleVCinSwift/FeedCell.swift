//
//  FeedCell.swift
//  InstagramStyleVCinSwift
//
//  Created by chris davis on 8/19/19.
//  Copyright © 2019 chris davis. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    
    let userInfoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    }()
    
    let userImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    let userName: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 1
        view.font = UIFont.boldSystemFont(ofSize: 14)
        return view
    }()
    
    let userOptionButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "option"), for: .normal)
        button.tintColor = UIColor.black
        return button
    }()
    
    let feedImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let activityView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    }()
    
    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Like"), for: .normal)
        button.tintColor = UIColor.black
        return button
    }()
    
    let commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Comment"), for: .normal)
        button.tintColor = UIColor.black
        return button
    }()
    
    let sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "direct"), for: .normal)
        button.tintColor = UIColor.black
        return button
    }()
    
    let collectButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Collect"), for: .normal)
        button.tintColor = UIColor.black
        return button
    }()
    
    let feedTextContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let likeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    let feedText: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    fileprivate func setupLayout(){
        addSubview(userInfoView)
        userInfoView.addSubview(userImage)
        userInfoView.addSubview(userName)
        userInfoView.addSubview(userOptionButton)
        addSubview(activityView)
        activityView.addSubview(likeButton)
        activityView.addSubview(commentButton)
        activityView.addSubview(sendButton)
        activityView.addSubview(collectButton)
        addSubview(feedImage)
        addSubview(feedTextContainerView)
        feedTextContainerView.addSubview(likeLabel)
        feedTextContainerView.addSubview(feedText)
        
        NSLayoutConstraint.activate([
            userInfoView.topAnchor.constraint(equalTo: topAnchor),
            userInfoView.leftAnchor.constraint(equalTo: leftAnchor),
            userInfoView.rightAnchor.constraint(equalTo: rightAnchor),
            userInfoView.heightAnchor.constraint(equalToConstant: feedUserInfoViewHeight),
            
            userImage.centerYAnchor.constraint(equalTo: userInfoView.centerYAnchor),
            userImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            userImage.widthAnchor.constraint(equalToConstant: feedUserImageHeight),
            userImage.heightAnchor.constraint(equalToConstant: feedUserImageHeight),
            
            userName.centerYAnchor.constraint(equalTo: userInfoView.centerYAnchor),
            userName.leftAnchor.constraint(equalTo: userImage.rightAnchor, constant: 10),
            userName.rightAnchor.constraint(equalTo: userInfoView.centerXAnchor),
            userName.heightAnchor.constraint(equalToConstant: feedUserInfoViewHeight*0.5),
            
            userOptionButton.centerYAnchor.constraint(equalTo: userInfoView.centerYAnchor),
            userOptionButton.rightAnchor.constraint(equalTo: userInfoView.rightAnchor, constant: -10),
            userOptionButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1),
            userOptionButton.heightAnchor.constraint(equalToConstant: feedUserInfoViewHeight*0.5),
            
            feedImage.topAnchor.constraint(equalTo: userInfoView.bottomAnchor),
            feedImage.leftAnchor.constraint(equalTo: leftAnchor),
            feedImage.rightAnchor.constraint(equalTo: rightAnchor),
            feedImage.heightAnchor.constraint(equalToConstant: screenWidth),
            
            activityView.topAnchor.constraint(equalTo: feedImage.bottomAnchor),
            activityView.leftAnchor.constraint(equalTo: leftAnchor),
            activityView.rightAnchor.constraint(equalTo: rightAnchor),
            activityView.heightAnchor.constraint(equalToConstant: activityViewHeight),
            
            likeButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            likeButton.centerYAnchor.constraint(equalTo: activityView.centerYAnchor),
            likeButton.heightAnchor.constraint(equalTo: activityView.heightAnchor, multiplier: 0.8),
            likeButton.widthAnchor.constraint(equalTo: activityView.heightAnchor, multiplier: 0.8),
            
            commentButton.leftAnchor.constraint(equalTo: likeButton.rightAnchor, constant: 5),
            commentButton.centerYAnchor.constraint(equalTo: activityView.centerYAnchor),
            commentButton.heightAnchor.constraint(equalTo: activityView.heightAnchor, multiplier: 0.8),
            commentButton.widthAnchor.constraint(equalTo: activityView.heightAnchor, multiplier: 0.8),
            
            sendButton.leftAnchor.constraint(equalTo: commentButton.rightAnchor, constant: 5),
            sendButton.centerYAnchor.constraint(equalTo: activityView.centerYAnchor),
            sendButton.heightAnchor.constraint(equalTo: activityView.heightAnchor, multiplier: 0.8),
            sendButton.widthAnchor.constraint(equalTo: activityView.heightAnchor, multiplier: 0.8),
            
            collectButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            collectButton.centerYAnchor.constraint(equalTo: activityView.centerYAnchor),
            collectButton.heightAnchor.constraint(equalTo: activityView.heightAnchor, multiplier: 0.8),
            collectButton.widthAnchor.constraint(equalTo: activityView.heightAnchor, multiplier: 0.8),
            
            feedTextContainerView.topAnchor.constraint(equalTo: activityView.bottomAnchor),
            feedTextContainerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            feedTextContainerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            feedTextContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            likeLabel.topAnchor.constraint(equalTo: feedTextContainerView.topAnchor),
            likeLabel.leftAnchor.constraint(equalTo: feedTextContainerView.leftAnchor, constant: 5),
            likeLabel.rightAnchor.constraint(equalTo: feedTextContainerView.rightAnchor, constant: -5),
            likeLabel.heightAnchor.constraint(equalTo: activityView.heightAnchor, multiplier: 0.5),
            
            feedText.topAnchor.constraint(equalTo: likeLabel.bottomAnchor),
            feedText.leftAnchor.constraint(equalTo: feedTextContainerView.leftAnchor, constant: 5),
            feedText.rightAnchor.constraint(equalTo: feedTextContainerView.rightAnchor, constant: -5),
            feedText.bottomAnchor.constraint(equalTo: feedTextContainerView.bottomAnchor)
            ])
        
        userImage.layer.cornerRadius = feedUserImageHeight/2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
