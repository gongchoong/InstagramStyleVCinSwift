//
//  StoryTabCell.swift
//  InstagramStyleVCinSwift
//
//  Created by chris davis on 8/13/19.
//  Copyright © 2019 chris davis. All rights reserved.
//

import UIKit

class StoryTabCell: UICollectionViewCell {
    
    let storyImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 11)
        label.textAlignment = .center
        return label
    }()
    
    let addStoryImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "storyAddImage")
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    fileprivate func setupLayout(){
        addSubview(storyImageView)
        addSubview(nameLabel)
        addSubview(addStoryImage)
        
        NSLayoutConstraint.activate([
            storyImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            storyImageView.topAnchor.constraint(equalTo: topAnchor, constant: (storyTabWidth - storyTabImageWidth)/4),
            storyImageView.widthAnchor.constraint(equalToConstant: storyTabImageWidth),
            storyImageView.heightAnchor.constraint(equalToConstant: storyTabImageWidth),
            
            nameLabel.topAnchor.constraint(equalTo: storyImageView.bottomAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            addStoryImage.bottomAnchor.constraint(equalTo: storyImageView.bottomAnchor),
            addStoryImage.rightAnchor.constraint(equalTo: storyImageView.rightAnchor),
            addStoryImage.widthAnchor.constraint(equalToConstant: storyTabImageWidth*0.25),
            addStoryImage.heightAnchor.constraint(equalToConstant: storyTabImageWidth*0.25)
            ])
        
        storyImageView.layer.cornerRadius = storyTabImageWidth*0.5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static var identifier: String {
        return String(describing: self)
    }

}
