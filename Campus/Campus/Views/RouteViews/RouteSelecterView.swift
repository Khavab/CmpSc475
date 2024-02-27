//
//  RouteSelecterView.swift
//  Campus
//
//  Created by Shibli Nomani on 2/27/24.
//

import SwiftUI
import MapKit
import CoreLocation

struct RouteSelecterView: View {
    @EnvironmentObject var mapModel: MapModel
    @State private var start: Building?
    @State private var end: Building?
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    
                    NavigationLink(destination: RouteListView(building: $start)) {
                        HStack {
                            Text("Start Building:")
                            Spacer()
                            Text(start?.name ?? "Select")
                                .foregroundColor(start == nil ? .blue : .primary)
                        }
                    }
                    
                    NavigationLink(destination: RouteListView(building: $end)) {
                        HStack {
                            Text("End Building:")
                            Spacer()
                            Text(end?.name ?? "Select")
                                .foregroundColor(end == nil ? .green : .primary)
                        }
                    }
                    
                    Button(action: submitAction) {
                        Text("Submit")
                            .foregroundColor(isButtonDisabled ? .gray : .primary)
                    }
                    .disabled(isButtonDisabled)
                    
                }
            }
        }
        .environmentObject(mapModel)
    }
    
    private func submitAction() {
        guard let startBuilding = start, let endBuilding = end else { return }
        mapModel.calculateRoute(from: startBuilding, to: endBuilding)
    }
    
    private var isButtonDisabled: Bool {
        start == nil || end == nil
    }
}


#Preview {
    RouteSelecterView()
        .environmentObject(MapModel())
}
