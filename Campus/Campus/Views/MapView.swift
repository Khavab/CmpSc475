//
//  MapView.swift
//  Campus
//
//  Created by Shibli Nomani on 2/16/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var mapModel: MapModel
    @State private var selectedBuilding: Building?
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: .constant(MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 40.8036202287245, longitude: -77.8578992214907),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )), annotationItems: mappedBuildings) { building in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(building.latitude), longitude: CLLocationDegrees(building.longitude))) {
                    Button(action: {
                        selectedBuilding = building
                    }) {
                        Image(systemName: "mappin.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(building.favorite ? .blue : .red)
                    }
                }
            }
        }
        .sheet(item: $selectedBuilding) { building in
            // This is where you present the details or options for the selected building
            BuildingDetailsView(building: building)
                .environmentObject(mapModel)
        }
    }
    
    private var mappedBuildings: [Building] {
        mapModel.buildings.filter { $0.mapped }
    }
}

struct BuildingDetailsView: View {
    @EnvironmentObject var mapModel: MapModel
    var building: Building
   
    
    var body: some View {
        if UIDevice.current.orientation.isPortrait {
            HStack {
                Text("\(building.name)\(building.year != 0 ? " (\(building.year))" : "")")
                if !building.photo.isEmpty {
                    Image(building.photo)
                }
                Button(building.favorite ? "Unfavorite" : "Favorite") {
                    toggleFavorite(for: building)
                }
                .buttonStyle(StyledButton(backgroundColor: building.favorite ? .red : .blue))
            }
        }
        else {
            VStack {
                Text("\(building.name)\(building.year != 0 ? " (\(building.year))" : "")")
                if !building.photo.isEmpty {
                    Image(building.photo)
                }
                Button(building.favorite ? "Unfavorite" : "Favorite") {
                    toggleFavorite(for: building)
                }
                .buttonStyle(StyledButton(backgroundColor: building.favorite ? .red : .blue))
            }
        }
    }
    
    private func toggleFavorite(for targetBuilding: Building) {
        guard let index = mapModel.buildings.firstIndex(where: { $0.code == targetBuilding.code }) else { return }

        var updatedBuilding = mapModel.buildings[index]
        updatedBuilding.favorite.toggle()
        mapModel.buildings[index] = updatedBuilding
    }

}

#Preview {
    ContentView()
        .environmentObject(MapModel())
}
