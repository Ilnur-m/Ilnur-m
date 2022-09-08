//
//  AppDelegate.swift
//  NewMet
//
//  Created by Артем Галушкин on 08.09.2022.
//

import UIKit
import ApphudSDK

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
        Apphud.start(apiKey: "app_LCoQ2TcU1wB7gXs2Eu6mTqyVuRfzK2")
        
        return true
    }
}
