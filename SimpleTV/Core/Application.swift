//
//  Application.swift
//  SimpleTV
//
//  Created by Armen Nagapetyan on 04.06.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import UIKit

final class Application {
    static let shared = Application()

    

    func configureMainInterface(in window: UIWindow) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let cdNavigationController = UINavigationController()
        cdNavigationController.tabBarItem = UITabBarItem(title: "CoreData",
                image: UIImage(named: "Box"),
                selectedImage: nil)
        let cdNavigator = DefaultPostsNavigator(services: coreDataUseCaseProvider,
                navigationController: cdNavigationController,
                storyBoard: storyboard)

        let rmNavigationController = UINavigationController()
        rmNavigationController.tabBarItem = UITabBarItem(title: "Realm",
                image: UIImage(named: "Toolbox"),
                selectedImage: nil)
        let rmNavigator = DefaultPostsNavigator(services: realmUseCaseProvider,
                navigationController: rmNavigationController,
                storyBoard: storyboard)

        let networkNavigationController = UINavigationController()
        networkNavigationController.tabBarItem = UITabBarItem(title: "Network",
                image: UIImage(named: "Toolbox"),
                selectedImage: nil)
        let networkNavigator = DefaultPostsNavigator(services: networkUseCaseProvider,
                navigationController: networkNavigationController,
                storyBoard: storyboard)

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
                cdNavigationController,
                rmNavigationController,
                networkNavigationController
        ]
        window.rootViewController = tabBarController

        cdNavigator.toPosts()
        rmNavigator.toPosts()
        networkNavigator.toPosts()
    }
}
