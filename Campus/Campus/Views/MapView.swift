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
    
    // Create a computed property to filter mapped buildings
    var mappedBuildings: [Building] {
        mapModel.buildings.filter { $0.mapped }
    }
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: .constant(MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 40.8036202287245, longitude: -77.8578992214907),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )), annotationItems: mappedBuildings) { building in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(building.latitude), longitude: CLLocationDegrees(building.longitude))) {
                    VStack {
                        Image(systemName: "mappin.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(building.favorite ? .blue : .red)
                            .contextMenu {
                                if !building.photo.isEmpty {
                                    Image(building.photo)
                                        .scaledToFit()
                                        .frame(width: 100, height: 400)
                                }
                                Text("\(building.name)\(building.year != 0 ? " (\(building.year))" : "")")
                                Button(building.favorite ? "Unfavorite" : "Favorite") {
                                    toggleFavorite(for: building)
                                }
                            }
                        Text(building.name)
                            .font(.caption)
                    }
                }
            }
        }
        .frame(width: 400, height: 500)
    }
    
    private func toggleFavorite(for building: Building) {
        if let index = mapModel.buildings.firstIndex(where: { $0.code == building.code }) {
            mapModel.buildings[index].favorite.toggle()
        }
    }
}

#Preview {
    MapView()
        .environmentObject(MapModel())
}
