//
//  PokemonTypeRow.swift
//  Pokedex
//
//  Created by Shibli Nomani on 3/26/24.
//

import SwiftUI

struct PokemonTypeRow: View {
    @EnvironmentObject var pokedexModel: PokedexModel
    @EnvironmentObject var filterModel: FilterModel
    var type: PokemonType
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(filteredPokemon, id: \.id) { pokemon in
                    NavigationLink(destination: PokemonView(pokemon: pokemon)) {
                        PokemonImage(pokemon: pokemon, inRow: true)
                    }
                }
            }
            .padding(.horizontal)
        }
        .listRowInsets(EdgeInsets())
    }
    
    var filteredPokemon: [Pokemon] {
        pokedexModel.pokemon.filter { pokemon -> Bool in
            pokemon.types.contains(where: { $0 == type }) &&
            pokemon.types.contains(where: { filterModel.filters[$0, default: false] })
        }
    }
}

#Preview {
    PokemonTypeRow(type: PokemonType.psychic)
        .environmentObject(PokedexModel())
        .environmentObject(FilterModel())
}
