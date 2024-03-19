//
//  PokemonView.swift
//  Pokedex
//
//  Created by Shibli Nomani on 3/19/24.
//

import SwiftUI

struct PokemonView: View {
    var pokemon: Pokemon
    
    var body: some View {
        VStack {
            PokemonImage(pokemon: pokemon)
            
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
            
            Text("Types")
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            
            TypesView(types: pokemon.types)
            
            Text("Weaknesses")
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            
            TypesView(types: pokemon.weaknesses)
        }
        .navigationTitle(pokemon.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
}
