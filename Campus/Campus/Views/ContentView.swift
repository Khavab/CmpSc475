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
            ZStack {
                MapView()
                    .ignoresSafeArea()
                
                VStack {
                    if !mapModel.route.isEmpty {
                        ZStack(alignment: .top) {
                            RouteStepsView()
                                .padding(.bottom)
                                .frame(height: 170)
                                .zIndex(1)
                        }
                    }
                    Spacer()
                    
                    MapButtonsView()
                        .padding(.bottom)
                }
            }
        }
        .environmentObject(mapModel)
    }
}

#Preview {
    ContentView()
        .environmentObject(MapModel())
}
