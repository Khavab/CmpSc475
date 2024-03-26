//
//  ContentView.swift
//  Pokedex
//
//  Created by Shibli Nomani on 3/19/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var pokedexModel = PokedexModel()
    
    var body: some View {

        NavigationStack {
            List {
                if pokedexModel.capCount != 0 {
                    Section(header: Text("Captured")) {
                        CapturedView()
                    }
                }
                
                ForEach(PokemonType.allCases, id: \.self) { type in
                    Section(header: Text(type.rawValue)) {
                        PokemonTypesRow(type: type)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Pokedex")
            .navigationBarTitleDisplayMode(.inline)
        }
        .environmentObject(pokedexModel)
    }
}

#Preview {
    ContentView()
}
