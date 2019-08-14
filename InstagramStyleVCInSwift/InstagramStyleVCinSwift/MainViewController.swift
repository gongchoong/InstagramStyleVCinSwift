//
//  ViewController.swift
//  InstagramStyleVCinSwift
//
//  Created by chris davis on 7/31/19.
//  Copyright © 2019 chris davis. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black
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
    }

    fileprivate func setupLayout(){
        view.addSubview(headerView)
        view.addSubview(mainTableView)
        
        NSLayoutConstraint.activate([
            
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            headerView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            headerView.heightAnchor.constraint(equalToConstant: screenHeight/15),
            
            mainTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            mainTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            mainTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        
        model = MainViewModel(mainTableView)
        mainTableView.delegate = model
        mainTableView.dataSource = model
        mainTableView.register(StoryTab.self, forCellReuseIdentifier: StoryTab.identifier)
        
    }
    
}

