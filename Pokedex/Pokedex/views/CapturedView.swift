//
//  CapturedView.swift
//  Pokedex
//
//  Created by Shibli Nomani on 3/26/24.
//

import SwiftUI

struct CapturedView: View {
    @EnvironmentObject var pokedexModel: PokedexModel
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(pokedexModel.pokemon, id: \.id) { pokemon in
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
}
