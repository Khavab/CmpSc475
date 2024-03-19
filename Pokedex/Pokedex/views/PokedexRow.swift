//
//  PokedexRow.swift
//  Pokedex
//
//  Created by Shibli Nomani on 3/19/24.
//

import SwiftUI

struct PokedexRow: View {
    let pokemon: Pokemon
    
    var body: some View {
        HStack {
            Text(String(pokemon.id))
                .font(.footnote)
            Spacer()
            
            Text(pokemon.name)
                .bold()
            Spacer()
            
            PokemonImage(pokemon: pokemon, inRow: true)
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    ContentView()
}
