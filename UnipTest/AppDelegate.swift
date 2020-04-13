//
//  AppDelegate.swift
//  UnipTest
//
//  Created by Pavel Privalov on 13.04.2020.
//  Copyright © 2020 Павел Привалов. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let firstViewController = FirstViewController.instantiateFromStoryboard()
        let navigationController = UINavigationController(rootViewController: firstViewController)
        
        navigationController.setNavigationBarHidden(true, animated: false)
        self.window?.rootViewController = navigationController
        return true
    }
}

