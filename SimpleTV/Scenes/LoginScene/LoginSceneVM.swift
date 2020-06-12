//
//  LoginSceneVM.swift
//  SimpleTV
//
//  Created by Armen Nagapetyan on 04.06.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class LoginSceneVM: ViewModelType{
    
    struct Input {
        let name: Observable<String>
        let password: Observable<String>
        let buttonTap: Observable<Void>
        let nextScreenTrigger: Driver<Void>
    }
    struct Output {
        let isValid: Driver<Bool>
        let writeInf: Driver<String>
        let netxScreen: Driver<Void>
    }
    
    private let navigator: MainScreenNavigation
    
    init( navigator: MainScreenNavigation) {
        self.navigator = navigator
    }
    
    func transform(input: Input) -> Output {
        let isValid = Observable.combineLatest(input.name, input.password){
            (username, password) in
            return username.count > 0
                && password.count > 0
        }
        .asDriver(onErrorJustReturn: false)
        let nameAndPassword: Observable<(String, String)> = Observable.combineLatest(input.name , input.password)
        
        
        let writeInf = input.buttonTap
            .withLatestFrom(nameAndPassword)
            .map({name , password in
                "Hi \(name) \nWelcome to new App"
            })
            .asDriver(onErrorJustReturn: "Sorry :(")
        let netxScreen = input.nextScreenTrigger
            .do(onNext: navigator.toGitScene)
        
        
        return Output(isValid: isValid, writeInf: writeInf, netxScreen: netxScreen)
    }
}
