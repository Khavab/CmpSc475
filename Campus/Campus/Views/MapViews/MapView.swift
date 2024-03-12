//
//  MapView.swift
//  Campus
//
//  Created by Shibli Nomani on 2/16/24.
//

import SwiftUI
import MapKit

struct CustomMapView: UIViewRepresentable {
    @EnvironmentObject var mapModel: MapModel
    @Binding var selectedBuilding: Building?
    @Binding var mapType: MKMapType
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, selectedBuilding: $selectedBuilding)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        mapView.mapType = mapType
        
        context.coordinator.setMapView(mapView)

        updateAnnotations(for: mapView)

        return mapView
    }


    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.mapType = mapType
        updateAnnotations(for: uiView)
    }
    
    private func updateAnnotations(for mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        
        let buildingAnnotations = mapModel.buildings.filter { $0.mapped }.map { building -> MKPointAnnotation in
            let annotation = MKPointAnnotation()
            annotation.title = building.name
            annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(building.latitude), longitude: CLLocationDegrees(building.longitude))
            return annotation
        }
        
        mapView.addAnnotations(buildingAnnotations)
        
        if let route = mapModel.route.first {
            let polyline = route.polyline
            mapView.addOverlay(polyline)
        }
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: CustomMapView
        @Binding var selectedBuilding: Building?
        weak var mapView: MKMapView?

        init(_ parent: CustomMapView, selectedBuilding: Binding<Building?>) {
            self.parent = parent
            self._selectedBuilding = selectedBuilding
        }
        
        func setMapView(_ mapView: MKMapView) {
                self.mapView = mapView

                let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(addAnnotation(_:)))
                mapView.addGestureRecognizer(longPressRecognizer)
            }
        
        @objc func addAnnotation(_ gestureRecognizer: UILongPressGestureRecognizer) {

            guard let mapView = mapView else {
                return
            }

            if gestureRecognizer.state == .began {
                let point = gestureRecognizer.location(in: mapView)
                let coordinate = mapView.convert(point, toCoordinateFrom: mapView)

                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                mapView.addAnnotation(annotation)
            }
        }

        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if annotation is MKUserLocation {
                return nil
            }
            
            let identifier = "Building"
            var view: MKMarkerAnnotationView
            
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            }
            
            view.markerTintColor = (annotation.title != nil) == parent.mapModel.favorites ? .green : .red
            
            return view
        }
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            if let buildingName = view.annotation?.title ?? "", let building = parent.mapModel.buildings.first(where: { $0.name == buildingName }) {
                selectedBuilding = building
            }
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if overlay is MKPolyline {
                let renderer = MKPolylineRenderer(overlay: overlay)
                renderer.strokeColor = .blue
                renderer.lineWidth = 5
                return renderer
            }
            return MKOverlayRenderer()
        }
    }
}

struct MapView: View {
    @EnvironmentObject var mapModel: MapModel
    @State private var selectedBuilding: Building?
    @Binding var mapType: MKMapType
    
    var body: some View {
        ZStack {
            CustomMapView(selectedBuilding: $selectedBuilding, mapType: $mapType)
                .ignoresSafeArea()
                .environmentObject(mapModel)
        }
        .sheet(item: $selectedBuilding) { building in
            BuildingDetailsView(building: building)
                .presentationDetents(building.photo.isEmpty ? [.height(120)] : [.height(320)])
                .environmentObject(mapModel)
        }
    }
}

struct AnnotationActionSheet: View {
    let annotation: MKAnnotation
    var removeAnnotation: () -> Void

    var body: some View {
        VStack {
            Button("Action 1") {
                print("Action 1 performed")
            }
            .padding()

            Button("Delete Annotation") {
                removeAnnotation()
            }
            .padding()
            .foregroundColor(.red)
        }
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
