//
//  PokemonImage.swift
//  Pokedex
//
//  Created by Shibli Nomani on 3/19/24.
//

import SwiftUI

struct PokemonImage: View {
    var pokemon: Pokemon
    var inRow: Bool
    
    var body: some View {
        let imageName = String(format: "%03d", pokemon.id)
        let gradient: [Color] = pokemon.types.count > 1 ?
        [Color(pokemonType: pokemon.types[0]), Color(pokemonType: pokemon.types[1])] :
        [Color(pokemonType: pokemon.types[0]), Color(pokemonType: pokemon.types[0])]
        
        ZStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(5)
            
            if !inRow {
                Text(imageName)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .offset(CGSize(width: 150.0, height: 160.0))
                    .bold()
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: gradient), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(30)
        .frame(width: inRow ? UIScreen.main.bounds.width / 4 : UIScreen.main.bounds.width * 0.95)
    }
}

#Preview {
    ContentView()
}
