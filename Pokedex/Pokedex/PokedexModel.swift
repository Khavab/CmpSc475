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
        
        self.captured = [Bool](repeating: false, count: self.pokemon.count)
    }
    
    func catchRelease(pokemon: Pokemon) {
        self.captured[pokemon.id] = !self.captured[pokemon.id]
    }
    
    func nextEvo(pokemon: Pokemon) -> Pokemon {
        return self.pokemon[pokemon.next_evolution[0] - 1]
    }
    
    func prevEvo(pokemon: Pokemon) -> Pokemon {
        return self.pokemon[pokemon.prev_evolution[pokemon.prev_evolution.count - 1] - 1]
    }
}
