//
//  GitSceneView.swift
//  SimpleTV
//
//  Created by Armen Nagapetyan on 09.06.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage
import Hero

class GitSceneTableViewCell:  GeneralTableViewCell {
    let avatarImageView = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let iconSelected = UIImageView()
    
    override func initUI() {
        self.selectionStyle = .none
        self.backgroundColor = .random()
        self.addSubview(avatarImageView)
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(iconSelected)
        
        titleLabel.text = "username"
        titleLabel.textColor = .black
        
        avatarImageView.heroID = "GitSceneTableViewCell"
        descriptionLabel.text = "description"
        descriptionLabel.textColor = .black
        descriptionLabel.numberOfLines = 0
        
        
    }
    override func prepareForReuse() {
        self.avatarImageView.image = nil
        self.titleLabel.text = nil
        self.descriptionLabel.text = nil
        self.iconSelected.image = nil
    }
    override func createConstraints() {
        iconSelected.snp.makeConstraints { make in
            make.width.equalTo(0)
            make.height.equalTo(22)
            make.centerY.equalTo(avatarImageView.snp.centerY)
            make.left.equalToSuperview().inset(5)
        }
        avatarImageView.snp.makeConstraints { make in
            make.width.equalTo(121)
            make.height.equalTo(121)
            make.left.equalToSuperview().inset(11)
            make.top.equalToSuperview().inset(11)
            make.bottom.equalToSuperview().inset(11)
            
        }
        titleLabel.snp.makeConstraints { make in
            make.topMargin.equalTo(avatarImageView.snp.topMargin).offset(11)
            make.right.equalToSuperview().offset(11)
            make.left.equalTo(avatarImageView.snp.right).offset(5)
        }
        descriptionLabel.snp.makeConstraints {  make in
            make.topMargin.equalTo(titleLabel.snp.bottom).offset(15)
            make.right.equalToSuperview().inset(5)
            make.left.equalTo(avatarImageView.snp.right).offset(5)
            make.bottomMargin.equalToSuperview().inset(11)
        }
        UIView.animate(withDuration: 1, delay: 0, animations: {
            self.layoutIfNeeded()
        })
    }
    
    func updateSelected(){
        
        UIView.animate(withDuration: 1) {
            self.backgroundColor = .yellow
            self.iconSelected.image = UIImage(named: "Icon")
            self.iconSelected.snp.updateConstraints { make in
                make.width.equalTo(22)
            }
            self.avatarImageView.snp.updateConstraints { make in
                make.left.equalToSuperview().inset(21)
                make.width.equalTo(105)
                make.height.equalTo(105)
            }
            self.layoutIfNeeded()
        }
    }
    
    func updateDeselectedCell(){
        self.backgroundColor = .random()

        iconSelected.snp.updateConstraints { make in
            make.width.equalTo(0)
            make.height.equalTo(0)
        }
        avatarImageView.snp.updateConstraints { make in
            make.width.equalTo(121)
            make.height.equalTo(121)
        }
        self.layoutIfNeeded()
    }
    
    func bind(_ viewModel:RealmGitRepoItemViewModel) {
        self.titleLabel.text = viewModel.title
        self.descriptionLabel.text = viewModel.descriptionss
        if let url =  viewModel.imageUrl{
            avatarImageView.sd_setImage(with: URL(string: url))
        }
        viewModel.isSelected ? updateSelected() : ()
    }
}

