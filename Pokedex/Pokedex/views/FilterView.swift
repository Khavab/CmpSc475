//
//  FilterView.swift
//  Pokedex
//
//  Created by Shibli Nomani on 3/26/24.
//

import SwiftUI

struct FilterView: View {
    @EnvironmentObject var filterModel: FilterModel
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button(action: {filterModel.addAll()}) {
                    Text("Add All")
                }
                .padding()
                .bold()
                .foregroundColor(.white)
                .background(.green, in: Capsule())
                
                Spacer()
                
                Button(action: {filterModel.clearAll()}) {
                    Text("Clear All")
                }
                .padding()
                .bold()
                .foregroundColor(.white)
                .background(.red, in: Capsule())
                
                Spacer()
            }
            
            List {
                ForEach(PokemonType.allCases, id: \.self) { type in
                    Toggle(isOn: Binding(
                        get: { self.filterModel.filters[type, default: false] },
                        set: { self.filterModel.filters[type] = $0 }
                    )) {
                        Text(type.rawValue)
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    FilterView()
        .environmentObject(FilterModel())
}
