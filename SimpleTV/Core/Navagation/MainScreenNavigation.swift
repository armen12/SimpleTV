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
}
class ScreenNavigation: MainScreenNavigation {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let vc = LoginSceneViewController()
        vc.viewModel = LoginSceneVM(navigator: self)
        navigationController.pushViewController(vc, animated: false)
    }
    func toGitScene(){
        let vc = GitSceneViewController()
        let network = GitRepoServices()
        vc.viewModel = GitSceneViewModel(navigator: self, network: network)
        navigationController.pushViewController(vc, animated: false)
    }
    func toSingleRepo(){
        
    }
    
    
}
