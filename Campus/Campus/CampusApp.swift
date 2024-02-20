//
//  CampusApp.swift
//  Campus
//
//  Created by Shibli Nomani on 2/16/24.
//

import SwiftUI

@main
struct CampusApp: App {
    @StateObject var mapModel = MapModel()
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView() // Replace with your main view
                .environmentObject(mapModel)
                .onChange(of: scenePhase) { oldPhase, newPhase in
                    if newPhase == .background {
                        mapModel.saveBuildings()
                    }
                }
        }
    }
    
}
