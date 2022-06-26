//
//  danmakuApp.swift
//  danmaku
//
//  Created by DifferThink on 6/25/22.
//

import SwiftUI

@main
struct appnameApp: App {
	@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
	var body: some Scene {
		WindowGroup {
			ContentView()
		}
	}
}

class AppDelegate: NSObject, UIApplicationDelegate {
	
	static var orientationLock = UIInterfaceOrientationMask.portrait
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
			// something to do
		return true
	}
	
	func application(_ application: UIApplication, supportedInterfaceOrientationsFor window:UIWindow?) -> UIInterfaceOrientationMask {
		return AppDelegate.orientationLock
	}
}
