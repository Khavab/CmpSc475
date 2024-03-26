//
//  EvolutionsView.swift
//  Pokedex
//
//  Created by Shibli Nomani on 3/23/24.
//

import SwiftUI

struct EvolutionsView: View {
    @EnvironmentObject var pokedex: PokedexModel
    var pokemon: Pokemon
    
    var body: some View {
        ZStack {
            Button(action: {pokedex.catchRelease(pokemon: pokemon)}) {
                Text(pokedex.captured[pokemon.id] ? "Release" : "Capture")
            }
            .padding()
            .bold()
            .foregroundColor(.white)
            .background(pokedex.captured[pokemon.id] ? .red : .green, in: Capsule())
            
            if pokemon.next_evolution.count != 0 {
                NavigationLink(destination: PokemonView(pokemon: pokedex.nextEvo(pokemon: pokemon))) {
                    PokemonImage(pokemon: pokedex.nextEvo(pokemon: pokemon), inRow: true)
                }
                .offset(CGSize(width: UIScreen.main.bounds.width * 3 / 7, height: 0))
            }
            
            if pokemon.prev_evolution.count != 0 {
                NavigationLink(destination: PokemonView(pokemon: pokedex.prevEvo(pokemon: pokemon))) {
                    PokemonImage(pokemon: pokedex.prevEvo(pokemon: pokemon), inRow: true)
                }
                .offset(CGSize(width: -UIScreen.main.bounds.width * 3 / 7, height: 0))
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(PokedexModel())
}
