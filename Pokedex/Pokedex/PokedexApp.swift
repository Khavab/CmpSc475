//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Shibli Nomani on 3/19/24.
//

import SwiftUI

@main
struct PokedexApp: App {
    @StateObject var pokedexModel = PokedexModel()
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pokedexModel)
                .onChange(of: scenePhase) { oldPhase, newPhase in
                if newPhase == .background {
                    pokedexModel.saveCaptured()
                }
            }
        }
    }
}
