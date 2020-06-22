//
//  ViewController.swift
//  SimpleTV
//
//  Created by Armen Nagapetyan on 04.06.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginSceneViewController: UIViewController {
    var currentView: LoginView{
        return self.view as! LoginView
    }
    let disposeBag = DisposeBag()
    var viewModel: LoginSceneVM!
    
    override func loadView() {
        super.loadView()
        //        self.currentView.layoutIfNeeded()
        
        self.view = LoginView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    private func bindViewModel(){
        let input = LoginSceneVM.Input(name: currentView.nameTextField.rx.text.orEmpty.asObservable(), password: currentView.passwordTextView.rx.text.orEmpty.asObservable(), buttonTap: currentView.showInfo.rx.tap.asObservable(), nextScreenTrigger: currentView.nextScreenButton.rx.tap.asDriver())
        
        let output = viewModel.transform(input: input)
        output.isValid
            .drive(currentView.showInfo.rx.isEnabled)
            .disposed(by: disposeBag)
        output.writeInf
            .drive(currentView.infoLabel.rx.text)
            .disposed(by: disposeBag)
        output.writeInf
        .drive(onNext: { (str) in
            self.currentView.updateTextFields()
            
        }).disposed(by: disposeBag)
        output.netxScreen
            .drive()
            .disposed(by: disposeBag)
    }
}

