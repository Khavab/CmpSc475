//
//  ButtonsVView.swift
//  Campus
//
//  Created by Shibli Nomani on 2/20/24.
//

import SwiftUI

struct ButtonsVView: View {
    @EnvironmentObject var mapModel: MapModel
    
    var body: some View {
        VStack {
            VStack {
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
}

#Preview {
    ButtonsVView()
        .environmentObject(MapModel())
}
