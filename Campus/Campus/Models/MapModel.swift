//
//  MapModel.swift
//  Campus
//
//  Created by Shibli Nomani on 2/20/24.
//

import Foundation

class MapModel: ObservableObject {
    @Published var buildings: [Building]
    
    init() {
        self.buildings = []
        loadBuildings()
    }
    
    func loadBuildings() {
        guard let url = Bundle.main.url(forResource: "buildings", withExtension: "json") else {
            print("Buildings json file not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            self.buildings = try decoder.decode([Building].self, from: data)
        } catch {
            print("Error decoding buildings: \(error)")
        }
    }
    
    func updateBuildings(buildings: [Building]) {
        self.buildings = buildings
    }
    
    func deselect() {
        self.buildings = self.buildings.map { building in
            var updatedBuilding = building
            updatedBuilding.mapped = false
            return updatedBuilding
        }
    }
}


