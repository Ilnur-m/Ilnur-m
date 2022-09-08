//
//  StateManager.swift
//  VPNClient
//
//  Created by lk on 21.03.2022.
//

import Foundation
import SwiftUI

enum LogicStatus {
    case waitDisconnectAfterChangeRegion
    case connecting
    case connected
    case disconnecting
    case disconnected
    case error
    case undefined

}

enum PublicStatus {
    case waitDisconnectAfterChangeRegion
    case connecting
    case connected
    case disconnecting
    case disconnected
    case error
    case undefined
    
    var description : String {
        
//        "loc.st.changeServer" = "Change server..";
//        "loc.st.connecting" = "Connecting..";
//        "loc.st.connected" = "Connected";
//        "loc.st.disconnecting" = "Disconnecting..";
//        "loc.st.disconnected" = "Disconnect";
//        "loc.st.error" = "Error..";
//        "loc.st.notConnected" = "Not connected";

        
        switch self {
            case .waitDisconnectAfterChangeRegion: return NSLocalizedString("loc.st.changeServer", comment: "Change server..")
            case .connecting: return NSLocalizedString("loc.st.connecting", comment: "Connecting..")
            case .connected: return NSLocalizedString("loc.st.connected", comment:"Подключен")
            case .disconnecting: return NSLocalizedString("loc.st.disconnecting", comment:"Отключаюсь..")
            case .disconnected: return NSLocalizedString("loc.st.disconnected", comment:"Отключен")
            case .error: return NSLocalizedString("loc.st.error",  comment:"Ошибка..")
            case .undefined: return NSLocalizedString("loc.st.notConnected", comment:"Не подключен")
        }
      }
}

class StateManager: ObservableObject {
    
    @Published var newLogicStatus = LogicStatus.undefined
    @Published var publicStatus = PublicStatus.undefined
    
    @Published var showedPerSession: Bool = false
    
    @Published var showPaywall: Bool
    @Published var expanded = false
    @Published var progress: CGFloat = 0.0
    @Published var start = false
    
    let expectedRange = 35...40
    var calculatedSpeed: CGFloat = 0.0
    var selectedIndex = 0


    init(showPaywall: Bool) {
            self.showPaywall = showPaywall
    }
    
    func expandCollapseView() {
        expanded.toggle()
    }
}
