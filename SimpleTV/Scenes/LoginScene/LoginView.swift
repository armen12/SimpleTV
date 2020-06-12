//
//  LoginView.swift
//  SimpleTV
//
//  Created by Armen Nagapetyan on 08.06.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//
import SnapKit
import UIKit

class LoginView:  GenericView{
    let titleLabel = UILabel()
    let nameTextField = UITextField()
    let passwordTextView = UITextField()
    let showInfo = UIButton()
    let infoLabel = UILabel()
    let nextScreenButton = UIButton()
    
    override func initUI(){
        addSubview(titleLabel)
        addSubview(nameTextField)
        addSubview(passwordTextView)
        addSubview(showInfo)
        addSubview(infoLabel)
        addSubview(nextScreenButton)
        self.backgroundColor = .yellow
        
        
        titleLabel.text = "Start New Life"
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textColor  = .blue
        titleLabel.textAlignment = .center
        
        nameTextField.placeholder = "Enter your name"
        nameTextField.borderStyle = .roundedRect
        
        
        passwordTextView.placeholder = "Enter your last name"
        passwordTextView.borderStyle = .roundedRect
        
        showInfo.setTitle("Show Inf", for: .normal)
        showInfo.setTitleColor(.black, for: .normal)
        showInfo.isEnabled = false
        
        infoLabel.numberOfLines = 0
        infoLabel.font = UIFont.boldSystemFont(ofSize: 20)
        infoLabel.textColor  = .purple
        infoLabel.textAlignment = .center
        
        nextScreenButton.setTitle("Open next screen", for: .normal)
        nextScreenButton.setTitleColor(.black, for: .normal)
    }
    override func createConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(80)
            make.width.equalToSuperview().inset(0)
        }
        nameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.width.equalToSuperview().inset(0)
        }
        passwordTextView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameTextField.snp.bottom).offset(10)
            make.width.equalToSuperview().inset(0)
        }
        showInfo.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextView.snp.bottom).offset(15)
        }
        infoLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(showInfo.snp.bottom).offset(10)
        }
        nextScreenButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(infoLabel.snp.bottom).offset(15)
        }
    }
    
    func updateTextFields(){
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.nameTextField.snp.updateConstraints { make in
                make.width.equalToSuperview().inset(20)
            }
            self.passwordTextView.snp.updateConstraints { make in
                make.width.equalToSuperview().inset(20)
            }
            self.layoutIfNeeded()
            
        })
    }
}
