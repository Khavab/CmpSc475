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
            ZStack(alignment: .bottom) {
                MapView()
                    .ignoresSafeArea()

                MapButtonsView()
                    .padding(.bottom)
            }
        }
        .environmentObject(mapModel)
    }
}


#Preview {
    ContentView()
        .environmentObject(MapModel())
}
