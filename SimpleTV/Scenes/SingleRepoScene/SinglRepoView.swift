//
//  SinglRepoView.swift
//  SimpleTV
//
//  Created by Armen Nagapetyan on 16.06.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import Foundation
import SnapKit
import Hero
class SinglRepoView: GenericView{
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let image = UIImageView()
    
    override func initUI(){
        self.isHeroEnabled = true
//        self.isHeroEnabledForSubviews = true
        self.backgroundColor = .red
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(image)
        
        self.image.heroID = "GitSceneTableViewCell"
        
        descriptionLabel.textColor = .black
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        titleLabel.textColor = .black
        
    }
    override func createConstraints(){
        let topLayout = self.snp.topMargin
        image.snp.makeConstraints { make in
            
            make.top.equalTo(topLayout).inset(12)
            make.width.equalTo(120)
            make.height.equalTo(120)
            make.centerX.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.width.equalTo(160)
//            make.height.equalTo(120)
            make.centerX.equalToSuperview()
        }
    }
}
