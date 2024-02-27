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
            )), annotationItems: mappedBuildings){ building in
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
            BuildingDetailsView(building: building)
                .presentationDetents(building.photo.isEmpty ? [.height(120)] : [.height(320)])
                .environmentObject(mapModel)
                .frame(height: 200)
        }
    }
    
    private var mappedBuildings: [Building] {
        mapModel.buildings.filter { $0.mapped }
    }
}

#Preview {
    ContentView()
        .environmentObject(MapModel())
}
