//
//  PokemonTypesRow.swift
//  Pokedex
//
//  Created by Shibli Nomani on 3/25/24.
//

import SwiftUI

struct PokemonTypesRow: View {
    @EnvironmentObject var pokedexModel: PokedexModel
    var type: PokemonType
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(pokedexModel.pokemon.filter { $0.types.contains(type) }, id: \.id) { pokemon in
                    NavigationLink(destination: PokemonView(pokemon: pokemon)) {
                        PokemonImage(pokemon: pokemon, inRow: true)
                    }
                }
            }
            .padding(.horizontal)
        }
        .listRowInsets(EdgeInsets())
    }
}

#Preview {
    PokemonTypesRow(type: PokemonType.psychic)
        .environmentObject(PokedexModel())
}
