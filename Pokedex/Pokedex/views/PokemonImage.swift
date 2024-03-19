//
//  PokemonImage.swift
//  Pokedex
//
//  Created by Shibli Nomani on 3/19/24.
//

import SwiftUI

struct PokemonImage: View {
    var id: Int
    
    var body: some View {
        let imageName = String(format: "%03d", id)
        
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    ContentView()
}
