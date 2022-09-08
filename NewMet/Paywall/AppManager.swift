//
//  VPNManager.swift
//  VPNClient
//
//  Created by wl on 2021/3/15.
//

import Foundation
import NetworkExtension
import ApphudSDK
//import RevenueCat
//import SwiftyBeaver
//import RevenueCat

class AppManager {
    
    static let shared = AppManager()
    var offeringList: Offerings?
    
    //var products: [SK1Product]?
    
    var products: [ApphudProduct]?
    
    var paywall: ApphudPaywall?
    
    var transparent = 0.1
    var sub = "Subscribe"
    
    //var isPro: Bool = false

    private init(){
        
    }
}
