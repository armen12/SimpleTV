//
//  Application.swift
//  SimpleTV
//
//  Created by Armen Nagapetyan on 05.06.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import UIKit
final class Application{
    static let shared = Application()
    func configureMainInterface(in window: UIWindow) {
        let navigationController = UINavigationController()
        let navigator = ScreenNavigation(navigationController: navigationController)
        window.rootViewController = navigator.navigationController
        window.makeKeyAndVisible()
        navigator.start()

    }

}
