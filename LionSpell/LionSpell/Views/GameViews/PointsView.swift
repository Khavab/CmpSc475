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
            Text(String(score))
                .font(.title)
                .fontWeight(.bold)
            Text("points")
                .font(.headline)
                .foregroundColor(.gray)
    }
}
