//
//  BuildingsListView.swift
//  Campus
//
//  Created by Shibli Nomani on 2/20/24.
//

import SwiftUI

struct BuildingsListView: View {
    @EnvironmentObject var mapModel: MapModel
    @State private var selectedBuildingCodes = Set<Int>()
    
    var body: some View {
        VStack {
            List(sortedBuildings, id: \.code, selection: $selectedBuildingCodes) { building in
                Text(buildingDisplayName(building: building))
            }
            .onChange(of: selectedBuildingCodes) { _, newSelection in
                updateMappedStatusForAllBuildings()
            }
            .onAppear {
                selectedBuildingCodes = Set(mapModel.buildings.filter { $0.mapped }.map { $0.code })
            }
            .environment(\.editMode, .constant(.active))
        }
    }
    
    private var sortedBuildings: [Building] {
        mapModel.buildings.sorted { $0.name < $1.name }
    }
    
    private func updateMappedStatusForAllBuildings() {
        var updatedBuildings = mapModel.buildings
        for index in updatedBuildings.indices {
            let isMapped = selectedBuildingCodes.contains(updatedBuildings[index].code)
            updatedBuildings[index].mapped = isMapped
            
        }
        mapModel.updateBuildings(buildings: updatedBuildings)
    }
    
    
    private func buildingDisplayName(building: Building) -> String {
        building.favorite ? "\(building.name) <3" : building.name
    }
}

#Preview {
    BuildingsListView()
        .environmentObject(MapModel())
}
