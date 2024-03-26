//
//  FilterModel.swift
//  Pokedex
//
//  Created by Shibli Nomani on 3/26/24.
//

import Foundation

class FilterModel: ObservableObject {
    @Published var filters: [PokemonType: Bool] = [:]
    
    init() {
        for type in PokemonType.allCases {
            self.filters[type] = true
        }
    }
    
    func addAll() {
        for type in PokemonType.allCases {
            self.filters[type] = true
        }
    }
    
    func clearAll() {
        for type in PokemonType.allCases {
            self.filters[type] = false
        }
    }
}
