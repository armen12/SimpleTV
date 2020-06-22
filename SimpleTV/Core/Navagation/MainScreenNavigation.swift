//
//  MainCoordinator.swift
//  SimpleTV
//
//  Created by Armen Nagapetyan on 04.06.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import UIKit
import RxSwift
protocol MainScreenNavigation {
    func start()
    func toGitScene()
    func toSingleRepo(model: GitRepoModel)
}
class ScreenNavigation: MainScreenNavigation {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
//        self.navigationController.isHeroEnabled = true
    }
    func start() {
        let vc = LoginSceneViewController()
        vc.viewModel = LoginSceneVM(navigator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    func toGitScene(){
        let vc = GitSceneViewController()
        let network = GitRepoServices()
        vc.viewModel = GitSceneViewModel(navigator: self, network: network)
//        navigationController.heroNavigationAnimationType = .zoom

        navigationController.pushViewController(vc, animated: true)
    }
    func toSingleRepo(model: GitRepoModel){
        let vc = SingleRepoViewController()
        vc.model = model
//        vc.viewModel = SingleRepoViewModel(navigator: self, model: model)
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}
