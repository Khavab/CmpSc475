//
//  MapModel.swift
//  Campus
//
//  Created by Shibli Nomani on 2/20/24.
//

import Foundation
import CoreLocation

class MapModel: ObservableObject {
    @Published var buildings: [Building]
    @Published var favorites: Bool = false
    var locationManager = CLLocationManager()
    
    init() {
        self.buildings = []
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        loadBuildings()
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

}
