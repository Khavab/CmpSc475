//
//  ContentView.swift
//  Pokedex
//
//  Created by Shibli Nomani on 3/19/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var pokedexModel = PokedexModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(pokedexModel.pokemon, id: \.id) { pokemon in
                    NavigationLink(destination: PokemonView(pokemon: pokemon)){
                        PokedexRow(pokemon: pokemon)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Pokedex")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
