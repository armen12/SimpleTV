//
//  GitSceneView.swift
//  SimpleTV
//
//  Created by Armen Nagapetyan on 11.06.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import UIKit
import Hero
class GitSceneView: GenericView{
    
    let tableView = UITableView()
    let withFilterButton = UIButton()
    let withoutFilterButton = UIButton()
    let viewForButtons = UIView()
    override func initUI(){
        self.backgroundColor = .gray
        
        self.addSubview(viewForButtons)
        self.addSubview(tableView)
        self.viewForButtons.addSubview(withFilterButton)
        self.viewForButtons.addSubview(withoutFilterButton)
        
        self.setupTV()
        self.setupUI()
    }
    func setupTV(){
        tableView.separatorStyle = .none
        tableView.register(GitSceneTableViewCell.self, forCellReuseIdentifier: GitSceneTableViewCell.reuseID)
        tableView.rowHeight = UITableView.automaticDimension
    }
    func setupUI(){
        self.viewForButtons.backgroundColor = .brown
        
        withFilterButton.setTitle("Filter", for: .normal)
        withoutFilterButton.setTitle("None", for: .normal)
        withFilterButton.setTitleColor(.black, for: .normal)
        withoutFilterButton.setTitleColor(.black, for: .normal)
        
        withFilterButton.layer.cornerRadius = 5
        withFilterButton.layer.borderWidth = 1
        withFilterButton.layer.borderColor = UIColor.white.cgColor
        
        withoutFilterButton.layer.cornerRadius = 5
        withoutFilterButton.layer.borderWidth = 2
        withoutFilterButton.layer.borderColor = UIColor.white.cgColor
        
    }
    override func createConstraints() {
        self.viewForButtons.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.top.equalTo(self.snp_topMargin)
            make.height.equalTo(80)
        }
        self.withoutFilterButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(22)
            make.width.equalTo(100)
        }
        self.withFilterButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(22)
            make.width.equalTo(100)
        }
        self.tableView.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(self.viewForButtons.snp.bottom).inset(8)
        }
    }}
