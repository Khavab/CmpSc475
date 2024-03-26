//
//  ButtonsView.swift
//  Pokedex
//
//  Created by Shibli Nomani on 3/26/24.
//

import SwiftUI

struct ButtonsView: View {
    var body: some View {
        HStack {
            NavigationLink(destination: FilterView()) {
                Text("Filter")
                    .padding()
                    .bold()
                    .foregroundColor(.white)
                    .background(.green, in: Capsule())
            }
            
            NavigationLink(destination: PokemonRowsView()) {
                Text("Full List")
                    .padding()
                    .bold()
                    .foregroundColor(.white)
                    .background(.green, in: Capsule())
            }
        }
    }
}

#Preview {
    ButtonsView()
}
