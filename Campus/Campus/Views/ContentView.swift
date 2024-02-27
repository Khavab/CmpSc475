//
//  ContentView.swift
//  Campus
//
//  Created by Shibli Nomani on 2/16/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var mapModel: MapModel

    var body: some View {
        NavigationStack {
            MapView()
                .ignoresSafeArea()
                .overlay(
                    MapButtonsView()
                        .padding(),
                    alignment: .bottom
                )
        }
        .environmentObject(mapModel)
    }
}


#Preview {
    ContentView()
        .environmentObject(MapModel())
}
