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
            VStack{
                Map(coordinateRegion: .constant(MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: 40.8036202287245, longitude: -77.8578992214907),
                    span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                )), annotationItems: mappedBuildings) { building in
                    MapMarker(coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(building.latitude), longitude: CLLocationDegrees(building.longitude)), tint: .red)
                }
            }
        }
        .frame(width: 400, height: 500)
    }
}

#Preview {
    MapView()
        .environmentObject(MapModel())
}
