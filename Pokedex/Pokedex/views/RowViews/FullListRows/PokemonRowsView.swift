//
//  PokemonRowsView.swift
//  Pokedex
//
//  Created by Shibli Nomani on 3/26/24.
//

import SwiftUI

struct PokemonRowsView: View {
    @EnvironmentObject var pokedexModel: PokedexModel
    @EnvironmentObject var filterModel: FilterModel
    
    var body: some View {
        List {
            ForEach(pokedexModel.pokemon.filter { pokemon in
                pokemon.types.contains(where: { type in
                    filterModel.filters[type] == true
                })
            }, id: \.id) { pokemon in
                NavigationLink(destination: PokemonView(pokemon: pokemon)){
                    PokemonRow(pokemon: pokemon)
                }
                
            }
        }
        .listStyle(.plain)
        .navigationTitle("Pokedex")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
        .environmentObject(PokedexModel())
}

