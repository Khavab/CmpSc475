//
//  Pokemon.swift
//  Pokedex
//
//  Created by Shibli Nomani on 3/19/24.
//

import Foundation

struct Pokemon: Identifiable, Codable {
    let id: Int
    let name: String
    let types: [PokemonType]
    let height: Float
    let weight: Float
    let weaknesses: [PokemonType]
    let prev_evolution: [Int]
    let next_evolution: [Int]

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.types = try container.decode([PokemonType].self, forKey: .types)
        self.height = try container.decode(Float.self, forKey: .height)
        self.weight = try container.decode(Float.self, forKey: .weight)
        self.weaknesses = try container.decode([PokemonType].self, forKey: .weaknesses)
        self.prev_evolution = try container.decodeIfPresent([Int].self, forKey: .prev_evolution) ?? []
        self.next_evolution = try container.decodeIfPresent([Int].self, forKey: .next_evolution) ?? []
    }
}
