//
//  MapButtonsView.swift
//  Campus
//
//  Created by Shibli Nomani on 2/27/24.
//


import SwiftUI

struct MapButtonsView: View {
    @EnvironmentObject var mapModel: MapModel
    @State private var showingRouteSheet = false // State to control the sheet presentation

    var body: some View {
        VStack {
            HStack {
                NavigationLink(destination: BuildingsListView()) {
                    Text("Buildings")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .environmentObject(mapModel)

                Button(action: { mapModel.favoritesSwap() }) {
                    Text("Favorites")
                }
                .buttonStyle(StyledButton(backgroundColor: mapModel.favorites ? .green : .red))

                Button(action: { mapModel.deselect() }) {
                    Text("Clear")
                }
                .buttonStyle(StyledButton(backgroundColor: .blue))

                Button(action: { showingRouteSheet.toggle() }) {
                    Text("Route")
                }
                .buttonStyle(StyledButton(backgroundColor: .blue))
            }
        }
        .sheet(isPresented: $showingRouteSheet) {
            RouteSelecterView()
        }
    }
}

#Preview {
    MapButtonsView()
        .environmentObject(MapModel())
}

