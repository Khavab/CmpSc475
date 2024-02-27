//
//  MapModel.swift
//  Campus
//
//  Created by Shibli Nomani on 2/20/24.
//

import Foundation
import CoreLocation
import MapKit


class MapModel: ObservableObject {
    @Published var buildings: [Building]
    @Published var favorites: Bool = false
    @Published var toggle: String = "A"
    @Published var route: [MKRoute] = []
    
    var locationModel = LocationModel()
    
    @Published var userLocation: CLLocation?
    
    init() {
        self.buildings = []
        loadBuildings()
        setupLocationUpdates()
    }
    
    private func setupLocationUpdates() {
        locationModel.didUpdateLocations = { [weak self] locations in
            guard let self = self, let location = locations.first else { return }
            DispatchQueue.main.async {
                self.userLocation = location
            }
        }
    }
    
    func loadBuildings() {
        let documentsDirectoryURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let localURL = documentsDirectoryURL?.appendingPathComponent("buildings.json")
        
        if let localURL = localURL, FileManager.default.fileExists(atPath: localURL.path) {
            do {
                let data = try Data(contentsOf: localURL)
                self.buildings = try JSONDecoder().decode([Building].self, from: data)
                print("Loaded buildings from Documents directory")
                return
            } catch {
                print("Error loading buildings from Documents: \(error)")
            }
        }
        
        guard let bundleURL = Bundle.main.url(forResource: "buildings", withExtension: "json") else {
            print("Buildings json file not found in bundle")
            return
        }
        
        do {
            let data = try Data(contentsOf: bundleURL)
            self.buildings = try JSONDecoder().decode([Building].self, from: data)
            print("Loaded buildings from bundle")
        } catch {
            print("Error decoding buildings from bundle: \(error)")
        }
    }
    
    
    func updateBuildings(buildings: [Building]) {
        self.buildings = buildings
    }
    
    func deselect() {
        self.favorites = false
        self.route = []
        self.buildings = self.buildings.map { building in
            var updatedBuilding = building
            updatedBuilding.mapped = false
            return updatedBuilding
        }
    }
    
    func favoritesSwap() {
        self.favorites = !self.favorites
        
        self.buildings = self.buildings.map { building in
            var updatedBuilding = building
            if updatedBuilding.favorite {
                updatedBuilding.mapped = self.favorites
            }
            return updatedBuilding
        }
    }
    
    func saveBuildings() {
        do {
            let url = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("buildings.json")
            let encoder = JSONEncoder()
            let data = try encoder.encode(buildings)
            try data.write(to: url, options: [.atomicWrite])
            print("Buildings saved successfully")
        } catch {
            print("Failed to save buildings: \(error)")
        }
    }
    
    func calculateRoute(from startBuilding: Building, to endBuilding: Building) {
        let startCoordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(startBuilding.latitude), longitude: CLLocationDegrees(startBuilding.longitude))
        let endCoordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(endBuilding.latitude), longitude: CLLocationDegrees(endBuilding.longitude))
        
        let startPlacemark = MKPlacemark(coordinate: startCoordinate)
        let endPlacemark = MKPlacemark(coordinate: endCoordinate)
        
        let startItem = MKMapItem(placemark: startPlacemark)
        let endItem = MKMapItem(placemark: endPlacemark)
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = startItem
        directionRequest.destination = endItem
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate { [weak self] (response, error) in
            guard let self = self else { return }
            
            if let error = error {
                print("Error getting directions: \(error.localizedDescription)")
                return
            }
            
            guard let response = response, let route = response.routes.first else {
                print("No routes found")
                return
            }
            
            DispatchQueue.main.async {
                self.deselect()
                
                if let startIndex = self.buildings.firstIndex(where: { $0.id == startBuilding.id }) {
                    self.buildings[startIndex].mapped = true
                }
                
                if let endIndex = self.buildings.firstIndex(where: { $0.id == endBuilding.id }) {
                    self.buildings[endIndex].mapped = true
                }
                
                self.route = [route]
            }
        }
    }
    
}
