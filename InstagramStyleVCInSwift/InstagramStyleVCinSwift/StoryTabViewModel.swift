//
//  StoryTabViewModel.swift
//  InstagramStyleVCinSwift
//
//  Created by chris davis on 8/2/19.
//  Copyright © 2019 chris davis. All rights reserved.
//

import Foundation
import UIKit

class StoryTabViewModel: NSObject {
    
    var userArray = [User]()
    
    override init() {
        super.init()
        generateUsers()
    }
    
    fileprivate func generateUsers(){
        let userZero = User("Your Story", 0)
        let userOne = User("BaileyByron", 1)
        let userTwo = User("grayWill39", 2)
        let userThree = User("rivasCJana", 3)
        let userFour = User("TameraMitchell", 4)
        let userFive = User("vivianD", 5)
        let userSix = User("hensonIrma", 6)
        
        userArray.append(userZero)
        userArray.append(userOne)
        userArray.append(userTwo)
        userArray.append(userThree)
        userArray.append(userFour)
        userArray.append(userFive)
        userArray.append(userSix)
    }
}

extension StoryTabViewModel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if userArray.count > 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryTabCell.identifier, for: indexPath) as! StoryTabCell
            let user = userArray[indexPath.row]
            cell.storyImageView.image = UIImage(named: "user_\(user.imageNum)")
            cell.nameLabel.text = user.name
            if indexPath.row > 0{
                cell.addStoryImage.isHidden = true
            }else{
                cell.addStoryImage.isHidden = false
            }
            return cell
        }else{
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenWidth*0.2, height: screenWidth*0.25)
    }
    
}
