//
//  RouteStepsView.swift
//  Campus
//
//  Created by Shibli Nomani on 2/27/24.
//

import SwiftUI

struct RouteStepsView: View {
    @EnvironmentObject var mapModel: MapModel
    
    var body: some View {
        VStack {
            if let route = mapModel.route.first {
                Text("Expected travel time: \(formattedTravelTime(from: route.expectedTravelTime))")
            } else {
                Text("Expected travel time: N/A")
            }

            TabView {
                if let route = mapModel.route.first {
                    ForEach(Array(route.steps.dropFirst()), id: \.instructions) { step in
                        Text(step.instructions)
                            .padding()
                            .overlay(
                                Text("\(step.distance.formatted()) meters")
                                    .font(.footnote)
                                    .padding([.top], 5),
                                alignment: .bottom
                            )
                    }
                }
                else {
                    Text("No route steps available")
                }
            }
            .tabViewStyle(.page)
        }
        .background(Color.gray.opacity(0.5))
    }
    
    private func formattedTravelTime(from seconds: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .short
        return formatter.string(from: seconds) ?? "N/A"
    }
}

#Preview {
    RouteStepsView()
        .environmentObject(MapModel())
}

