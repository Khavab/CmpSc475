//
//  FavoritesView.swift
//  Campus
//
//  Created by Shibli Nomani on 2/20/24.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var mapModel: MapModel
    
    var body: some View {
        List(sortedFavoritedBuildings, id: \.code) { building in
            Text(building.name)
        }
        .navigationTitle("Favorites")
    }
    
    private var sortedFavoritedBuildings: [Building] {
        mapModel.buildings.filter { $0.favorite }.sorted { $0.name < $1.name }
    }
}

#Preview {
    FavoritesView()
        .environmentObject(MapModel())
}
