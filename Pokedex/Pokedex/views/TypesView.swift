//
//  TypesView.swift
//  Pokedex
//
//  Created by Shibli Nomani on 3/19/24.
//

import SwiftUI

struct TypesView: View {
    var types: [PokemonType]
    var body: some View {
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
}
