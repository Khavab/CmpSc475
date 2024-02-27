//
//  BuildingDetailsView.swift
//  Campus
//
//  Created by Shibli Nomani on 2/23/24.
//

import SwiftUI

struct BuildingDetailsView: View {
    @EnvironmentObject var mapModel: MapModel
    var building: Building
    
    
    var body: some View {
        VStack {
            Text("\(building.name)\(building.year != 0 ? " (\(building.year))" : "")")
            if !building.photo.isEmpty {
                Image(building.photo)
                    .resizable()
                    .frame(width: 400, height: 200)
            }
            Button(building.favorite ? "Unfavorite" : "Favorite") {
                toggleFavorite(for: building)
            }
            .buttonStyle(StyledButton(backgroundColor: building.favorite ? .red : .blue))
        }
        
    }
    
    private func toggleFavorite(for targetBuilding: Building) {
        guard let index = mapModel.buildings.firstIndex(where: { $0.code == targetBuilding.code }) else { return }
        
        var updatedBuilding = mapModel.buildings[index]
        updatedBuilding.favorite.toggle()
        mapModel.buildings[index] = updatedBuilding
    }
    
}
