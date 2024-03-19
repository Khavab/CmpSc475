//
//  PokemonImage.swift
//  Pokedex
//
//  Created by Shibli Nomani on 3/19/24.
//

import SwiftUI

struct PokemonImage: View {
    var pokemon: Pokemon
    
    var body: some View {
        let imageName = String(format: "%03d", pokemon.id)
        let gradient: [Color] = pokemon.types.count > 1 ? [Color(pokemonType: pokemon.types[0]), Color(pokemonType: pokemon.types[1])] : [Color(pokemonType: pokemon.types[0]), Color(pokemonType: pokemon.types[0])]
        
        ZStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .background(LinearGradient(gradient: Gradient(colors: gradient), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(30)
    }
}

#Preview {
    ContentView()
}
