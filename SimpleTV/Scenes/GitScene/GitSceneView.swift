//
//  GitSceneView.swift
//  SimpleTV
//
//  Created by Armen Nagapetyan on 11.06.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import UIKit
class GitSceneView: GenericView{
    
    let tableView = UITableView()
    
    override func initUI(){
        self.addSubview(tableView)
        self.backgroundColor = .yellow
        
        tableView.separatorStyle = .none
        tableView.register(GitSceneTableViewCell.self, forCellReuseIdentifier: GitSceneTableViewCell.reuseID)
        tableView.rowHeight = UITableView.automaticDimension
    }
    override func createConstraints() {
        tableView.snp.makeConstraints { make in
            make.height.equalTo(0)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    func updateTableView(){
        UIView.animate(withDuration: 1) {
            self.tableView.snp.makeConstraints { (make) in
                make.right.equalToSuperview()
                make.left.equalToSuperview()
                make.bottom.equalToSuperview()
                make.top.equalToSuperview()
            }
            self.layoutIfNeeded()
        }
    }
}
