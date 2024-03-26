//
//  PokemonImage.swift
//  Pokedex
//
//  Created by Shibli Nomani on 3/19/24.
//

import SwiftUI

struct PokemonImage: View {
    @EnvironmentObject var pokedex: PokedexModel
    var pokemon: Pokemon
    var inRow: Bool
    
    var body: some View {
        let imageName = String(format: "%03d", pokemon.id)
        let gradient: [Color] = pokemon.types.count > 1 ?
        [Color(pokemonType: pokemon.types[0]), Color(pokemonType: pokemon.types[1])] :
        [Color(pokemonType: pokemon.types[0]), Color(pokemonType: pokemon.types[0])]
        
        GeometryReader { geometry in
            ZStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .grayscale(inRow && !pokedex.captured[pokemon.id] ? 0.9995 : 0)
                    .padding(5)
                
                if !inRow {
                    Text(imageName)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .offset(CGSize(width: geometry.size.width * 0.4, height: geometry.size.width * 0.4))
                        .bold()
                }
            }
            .background(LinearGradient(gradient: Gradient(colors: gradient), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(30)
        }
        .frame(width: inRow ? UIScreen.main.bounds.width / 4 : UIScreen.main.bounds.width * 0.95, height: inRow ? UIScreen.main.bounds.width / 4 : UIScreen.main.bounds.width * 0.95)
    }
}

#Preview {
    ContentView()
        .environmentObject(PokedexModel())
}
