//
//  TypesView.swift
//  Pokedex
//
//  Created by Shibli Nomani on 3/19/24.
//

import SwiftUI

struct TypesView: View {
    var text: String
    var types: [PokemonType]
    
    var body: some View {
        Text(text)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
        
        ScrollView(.horizontal) {
            HStack {
                ForEach(types, id: \.id) { type in
                    TypeView(type: type)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct TypeView: View {
    var type: PokemonType
    var body: some View {
        Text(type.id)
            .padding()
            .bold()
            .foregroundColor(.white)
            .background(Color(pokemonType: type), in: Capsule())
    }
}

#Preview {
    ContentView()
        .environmentObject(PokedexModel())
}
