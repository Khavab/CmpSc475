//
//  ContentView.swift
//  Pokedex
//
//  Created by Shibli Nomani on 3/19/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var pokedexModel: PokedexModel
    @StateObject var filterModel = FilterModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                ButtonsView()
                
                TypeRowsView()
            }
        }
        .environmentObject(pokedexModel)
        .environmentObject(filterModel)
    }
}

#Preview {
    ContentView()
        .environmentObject(PokedexModel())
}
