//
//  TypeRowsView.swift
//  Pokedex
//
//  Created by Shibli Nomani on 3/26/24.
//

import SwiftUI

struct TypeRowsView: View {
    @EnvironmentObject var pokedexModel: PokedexModel
    
    var body: some View {
        List {
            if pokedexModel.capCount != 0 {
                Section(header: Text("Captured")) {
                    CapturedView()
                }
            }
            
            ForEach(PokemonType.allCases, id: \.self) { type in
                Section(header: Text(type.rawValue)) {
                    PokemonTypeRow(type: type)
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Pokedex")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
        .environmentObject(PokedexModel())
}
