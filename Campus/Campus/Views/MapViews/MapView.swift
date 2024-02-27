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
            Map(
                coordinateRegion: .constant(MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: 40.8036202287245, longitude: -77.8578992214907),
                    span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                )),
                showsUserLocation: true,
                annotationItems: annotations) { item in
                    MapAnnotation(coordinate: item.coordinate) {
                        if item.isRoutePoint {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 5, height: 5)
                        } else if let _ = item.building {
                            Button(action: {
                                selectedBuilding = item.building
                            }) {
                                Image(systemName: "mappin.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(item.building?.favorite ?? false ? .green : .red)
                            }
                        } else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 2500, height: 2500)
                                .foregroundColor(.blue)
                        }
                    }
                }
        }
        .sheet(item: $selectedBuilding) { building in
            BuildingDetailsView(building: building)
                .presentationDetents(building.photo.isEmpty ? [.height(120)] : [.height(320)])
                .environmentObject(mapModel)
        }
    }
    
    private var annotations: [MapAnnotationItem] {
        var points: [MapAnnotationItem] = mappedBuildings.map { MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees($0.latitude), longitude: CLLocationDegrees($0.longitude)), building: $0, isRoutePoint: false) }
        
        if let route = mapModel.route.first {
            let routePoints = route.polyline.points()
            for i in 0..<route.polyline.pointCount {
                let point = routePoints[i]
                let coordinate = point.coordinate
                points.append(MapAnnotationItem(coordinate: coordinate, building: nil, isRoutePoint: true))
            }
        }
        
        if let userLocation = mapModel.userLocation {
            let userLocationAnnotation = MapAnnotationItem(coordinate: userLocation.coordinate, building: nil, isRoutePoint: false)
            points.append(userLocationAnnotation)
        }
                
        return points
    }
    
    private var mappedBuildings: [Building] {
        mapModel.buildings.filter { $0.mapped }
    }
}

struct MapAnnotationItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let building: Building?
    let isRoutePoint: Bool
}

#Preview {
    ContentView()
        .environmentObject(MapModel())
}
