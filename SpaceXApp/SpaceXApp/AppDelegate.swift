//
//  AppDelegate.swift
//  SpaceXApp
//
//  Created by ayaz on 08.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		
		window = UIWindow(frame: UIScreen.main.bounds)
		let navigationController = UINavigationController(rootViewController: RocketsViewController())
		window?.rootViewController = navigationController
		window?.makeKeyAndVisible()
		
		
		let service: SettingsServiceProtocol = SettingsService()
		ServiceLocator.shared.register(service: service)
		
		return true
	}

}

