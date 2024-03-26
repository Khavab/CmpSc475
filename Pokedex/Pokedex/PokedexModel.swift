//
//  PokedexModel.swift
//  Pokedex
//
//  Created by Shibli Nomani on 3/19/24.
//

import Foundation

class PokedexModel: ObservableObject {
    @Published var pokemon: [Pokemon] = []
    @Published var captured: [Bool] = []
    @Published var capCount: Int = 0
        
    init() {
        let decoder = JSONDecoder()

        guard let localURL = Bundle.main.url(forResource: "pokedex", withExtension: "json") else {
            print("Pokedex JSON file not found in bundle.")
            return
        }
        
        do {
            let data = try Data(contentsOf: localURL)
            self.pokemon = try decoder.decode([Pokemon].self, from: data)
            print("Loaded pokedex from bundle")
        } catch {
            print("Error decoding pokedex from bundle: \(error)")
        }
        
        do {
            let url = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("captured.json")
            let data = try Data(contentsOf: url)
            self.captured = try decoder.decode([Bool].self, from: data)
            self.capCount = self.captured.filter { $0 }.count
        } catch {
            self.captured = [Bool](repeating: false, count: self.pokemon.count + 1)
        }
    }
    
    func catchRelease(pokemon: Pokemon) {
        self.captured[pokemon.id] = !self.captured[pokemon.id]
        self.capCount += self.captured[pokemon.id] ? 1 : -1
    }
    
    func nextEvo(pokemon: Pokemon) -> Pokemon {
        return self.pokemon[pokemon.next_evolution[0] - 1]
    }
    
    func prevEvo(pokemon: Pokemon) -> Pokemon {
        return self.pokemon[pokemon.prev_evolution[pokemon.prev_evolution.count - 1] - 1]
    }
    
    func saveCaptured() {
        do {
            let url = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("captured.json")
            let encoder = JSONEncoder()
            let data = try encoder.encode(self.captured)
            try data.write(to: url, options: [.atomicWrite])
            print("Captured saved successfully")
        } catch {
            print("Failed to save captured: \(error)")
        }
    }
}
