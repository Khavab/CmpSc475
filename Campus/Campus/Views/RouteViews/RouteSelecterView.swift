import SwiftUI
import MapKit
import CoreLocation

struct RouteSelecterView: View {
    @EnvironmentObject var mapModel: MapModel
    @State private var start: Building?
    @State private var end: Building?
    @State private var CurrentLocation: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                

                List {
                    Toggle("Current Location", isOn: $CurrentLocation)
                        .padding()
                    NavigationLink(destination: RouteListView(building: $start)) {
                        HStack {
                            Text("Start Building:")
                            Spacer()
                            Text(start?.name ?? "Select")
                                .foregroundColor(start == nil ? .blue : .primary)
                        }
                    }
                    .disabled(CurrentLocation)
                    

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
        guard let endBuilding = end else { return }

        if CurrentLocation {
            mapModel.calculateRouteLocal(endBuilding)
        } else {
            guard let startBuilding = start else { return }
            mapModel.calculateRoute(from: startBuilding, to: endBuilding)
        }
    }

    
    private var isButtonDisabled: Bool {
        (start == nil && !CurrentLocation) || end == nil
    }
}

#Preview {
    RouteSelecterView()
        .environmentObject(MapModel())
}
