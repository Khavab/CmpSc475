//
//  TopHeaderView.swift
//  LionSpell2
//
//  Created by Shibli Nomani on 1/23/24.
//

import SwiftUI

struct TopHeaderView: View {
    @Binding var preferences: Preferences
    
    var body: some View {
        HStack {
            Spacer()
            Text("Lion Spell")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
            NavigationLink(destination: FormView(preferences: $preferences)) {
                Image(systemName: "gearshape.fill")
            }
        }
        .frame(width: 340)
        .padding()
    }
}
