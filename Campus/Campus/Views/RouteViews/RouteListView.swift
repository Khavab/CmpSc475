import SwiftUI
import MapKit

struct RouteListView: View {
    @EnvironmentObject var mapModel: MapModel
    @State private var selectedBuildingCode: Int?
    @Binding var building: Building?
    
    var body: some View {
        VStack {
            ToggleButtonsView()
            
            List(filteredAndSortedBuildings, id: \.code) { building in
                HStack {
                    Text(buildingDisplayName(building: building))
                        .foregroundColor(selectedBuildingCode == building.code ? .blue : .primary)

                    Spacer()

                    if selectedBuildingCode == building.code {
                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    self.selectedBuildingCode = building.code
                    self.building = building
                }
            }
            .onAppear {
                if let currentBuilding = building {
                    selectedBuildingCode = currentBuilding.code
                }
            }
        }
    }
    
    private var filteredAndSortedBuildings: [Building] {
        let filteredBuildings: [Building]
        switch mapModel.toggle {
        case "F":
            filteredBuildings = mapModel.buildings.filter { $0.favorite }
        case "S":
            filteredBuildings = mapModel.buildings.filter { $0.mapped }
        default:
            filteredBuildings = mapModel.buildings
        }
        
        return filteredBuildings.sorted { $0.name < $1.name }
    }
    
    private func buildingDisplayName(building: Building) -> String {
        building.favorite ? "\(building.name) <3" : building.name
    }
}
