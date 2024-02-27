//
//  BuildingsListView.swift
//  Campus
//
//  Created by Shibli Nomani on 2/20/24.
//

import SwiftUI
import CoreLocation

struct BuildingsListView: View {
    @EnvironmentObject var mapModel: MapModel
    @State private var selectedBuildingCodes = Set<Int>()
    
    var body: some View {
        VStack {
            ToggleButtonsView()
            
            List(filteredAndSortedBuildings, id: \.code, selection: $selectedBuildingCodes) { building in
                Text(buildingDisplayName(building: building))
            }
            .onChange(of: selectedBuildingCodes) { _, _ in
                updateMappedStatusForAllBuildings()
            }
            .onAppear {
                selectedBuildingCodes = Set(mapModel.buildings.filter { $0.mapped }.map { $0.code })
            }
            .environment(\.editMode, .constant(.active))
        }
    }
    
    private var filteredAndSortedBuildings: [Building] {
        let filteredBuildings: [Building]
        switch mapModel.toggle {
        case "F":
            filteredBuildings = mapModel.buildings.filter { $0.favorite }
        case "S":
            filteredBuildings = mapModel.buildings.filter { $0.mapped }
        case "C":
            filteredBuildings = mapModel.buildings.filter {
                    isBuildingWithin50MetersOfUser(building: $0, userLocation: mapModel.userLocation)
                }
        default:
            filteredBuildings = mapModel.buildings
        }
        
        return filteredBuildings.sorted { $0.name < $1.name }
    }
    
    private func updateMappedStatusForAllBuildings() {
        var updatedBuildings = mapModel.buildings
        for index in updatedBuildings.indices {
            let isMapped = selectedBuildingCodes.contains(updatedBuildings[index].code)
            updatedBuildings[index].mapped = isMapped
        }
        mapModel.updateBuildings(buildings: updatedBuildings)
    }
    
    func isBuildingWithin50MetersOfUser(building: Building, userLocation: CLLocation?) -> Bool {
        guard let userLocation = userLocation else { return false }
        let buildingLocation = CLLocation(latitude: CLLocationDegrees(building.latitude), longitude: CLLocationDegrees(building.longitude))
        return userLocation.distance(from: buildingLocation) <= 50
    }
    
    private func buildingDisplayName(building: Building) -> String {
        building.favorite ? "\(building.name) <3" : building.name
    }
}


#Preview {
    BuildingsListView()
        .environmentObject(MapModel())
}
