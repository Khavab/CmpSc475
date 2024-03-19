//
//  ContentView.swift
//  Campus
//
//  Created by Shibli Nomani on 2/16/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @EnvironmentObject var mapModel: MapModel
    @State private var mapType: MKMapType = .standard
    
    var body: some View {
        NavigationStack {
            ZStack {
                MapView(mapType: $mapType)
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
                    
                    Picker("Map Type", selection: $mapType) {
                        Text("Standard").tag(MKMapType.standard)
                        Text("Hybrid").tag(MKMapType.hybrid)
                        Text("Satellite").tag(MKMapType.satellite)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    MapButtonsView()
                        .padding(.bottom, 50)
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
