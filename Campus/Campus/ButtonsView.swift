//
//  ButtonsView.swift
//  Campus
//
//  Created by Shibli Nomani on 2/20/24.
//

import SwiftUI

struct ButtonsView: View {
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
            
            Button(action: {}) {
                Text("Favorites")
            }
            .buttonStyle(StyledButton(backgroundColor: .blue))
            
            Button(action: {}) {
                Text("Deselect")
            }
            .buttonStyle(StyledButton(backgroundColor: .blue))
        }
    }
}

#Preview {
    ButtonsView()
        .environmentObject(MapModel())
}
