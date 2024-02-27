//
//  MapButtonsView.swift
//  Campus
//
//  Created by Shibli Nomani on 2/27/24.
//


import SwiftUI

struct MapButtonsView: View {
    @EnvironmentObject var mapModel: MapModel
    
    var body: some View {
        HStack {
            NavigationLink(destination: BuildingsListView()) {
                Text("Buildings")
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .environmentObject(mapModel)
            
            Button(action: {mapModel.favoritesSwap()}) {
                Text("Favorites")
            }
            .buttonStyle(StyledButton(backgroundColor: mapModel.favorites ? .green : .red))
            
            
            Button(action: {mapModel.deselect()}) {
                Text("Deselect")
            }
            .buttonStyle(StyledButton(backgroundColor: .blue))
        }
    }
}

#Preview {
    MapButtonsView()
        .environmentObject(MapModel())
}

