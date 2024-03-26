//
//  PokemonView.swift
//  Pokedex
//
//  Created by Shibli Nomani on 3/19/24.
//

import SwiftUI

struct PokemonView: View {
    @EnvironmentObject var pokedex: PokedexModel
    var pokemon: Pokemon
    
    var body: some View {
        VStack {
            PokemonImage(pokemon: pokemon, inRow: false)
            
            HStack {
                Spacer()
                Text("Height")
                    .bold()
                Spacer()
                Text("Weight")
                    .bold()
                Spacer()
            }
            
            HStack {
                Spacer()
                Text(String(pokemon.height) + " m")
                    .font(.title)
                    .bold()
                Spacer()
                Text(String(pokemon.weight) + " kg")
                    .font(.title)
                    .bold()
                Spacer()
            }
            
            TypesView(text: "Types", types: pokemon.types)
            
            TypesView(text: "Weakness", types: pokemon.weaknesses)
            
            EvolutionsView(pokemon: pokemon)
        }
        .navigationTitle(pokemon.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
        .environmentObject(PokedexModel())
}
