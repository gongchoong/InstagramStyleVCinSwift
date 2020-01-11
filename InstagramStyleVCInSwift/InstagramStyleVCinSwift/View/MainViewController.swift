//
//  ViewController.swift
//  InstagramStyleVCinSwift
//
//  Created by chris davis on 7/31/19.
//  Copyright © 2019 chris davis. All rights reserved.
//

import UIKit
import Parse

class MainViewController: UIViewController {
    
    let headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    }()
    
    let dividerLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    let logo: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "logo")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let direct: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "direct")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let camera: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "camera")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let mainTableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    var model: MainViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupLayout()
        //signUp()
    }

    fileprivate func setupLayout(){
        view.addSubview(headerView)
        headerView.addSubview(dividerLine)
        headerView.addSubview(logo)
        headerView.addSubview(camera)
        headerView.addSubview(direct)
        view.addSubview(mainTableView)
        
        NSLayoutConstraint.activate([
            
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            headerView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            headerView.heightAnchor.constraint(equalToConstant: headerViewHeight),
            
            dividerLine.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            dividerLine.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            dividerLine.heightAnchor.constraint(equalToConstant: 1),
            dividerLine.widthAnchor.constraint(equalTo: headerView.widthAnchor),
            
            logo.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            logo.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            logo.widthAnchor.constraint(equalTo: headerView.widthAnchor, multiplier: 0.5),
            logo.heightAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.65),
            
            camera.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            camera.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: screenWidth*0.025),
            camera.widthAnchor.constraint(equalToConstant: screenWidth*0.1),
            camera.heightAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.5),
            
            direct.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            direct.rightAnchor.constraint(equalTo: headerView.rightAnchor, constant: -screenWidth*0.025),
            direct.widthAnchor.constraint(equalToConstant: screenWidth*0.1),
            direct.heightAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.5),
            
            mainTableView.topAnchor.constraint(equalTo: dividerLine.bottomAnchor),
            mainTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            mainTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        
        model = MainViewModel(mainTableView)
        mainTableView.delegate = model
        mainTableView.dataSource = model
        mainTableView.separatorStyle = .none
        mainTableView.register(StoryTab.self, forCellReuseIdentifier: StoryTab.identifier)
        mainTableView.register(FeedCell.self, forCellReuseIdentifier: FeedCell.identifier)
    }
    
    func signUp() {
        let user = PFUser()
        user.username = "IsItWorking"
        user.password = "123123"
        user.signUpInBackground { (success, error) in
            if success{
                print("id creation successful")
            }else{
                if let descrip = error?.localizedDescription{
                    print(descrip)
                }
            }
        }
    }
    
}

