//
//  PointsView.swift
//  LionSpell2
//
//  Created by Shibli Nomani on 1/23/24.
//

import SwiftUI

struct PointsView: View {
    let score: Int
    var body: some View {
        HStack {
            Text(String(score))
                .font(.title)
                .fontWeight(.bold)
            Text("points")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
