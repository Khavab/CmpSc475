//
//  CapturedView.swift
//  Pokedex
//
//  Created by Shibli Nomani on 3/26/24.
//

import SwiftUI

struct CapturedView: View {
    @EnvironmentObject var pokedexModel: PokedexModel
    @EnvironmentObject var filterModel: FilterModel
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(pokedexModel.pokemon.filter { pokemon in
                    pokemon.types.contains(where: { type in
                        filterModel.filters[type] == true
                    })
                }, id: \.id) { pokemon in
                    if pokedexModel.captured[pokemon.id] {
                        NavigationLink(destination: PokemonView(pokemon: pokemon)) {
                            PokemonImage(pokemon: pokemon, inRow: true)
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .listRowInsets(EdgeInsets())
    }
}

#Preview {
    ContentView()
        .environmentObject(PokedexModel())
}
