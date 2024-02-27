//
//  ToggleButtonsView.swift
//  Campus
//
//  Created by Shibli Nomani on 2/27/24.
//

import SwiftUI

struct ToggleButtonsView: View {
    @EnvironmentObject var mapModel: MapModel
    
    var body: some View {
        HStack {
            Button(action: {mapModel.toggle = "A"}) {
                Text("All")
            }
            .buttonStyle(StyledButton(backgroundColor: mapModel.toggle == "A" ? .green : .red))
            
            Button(action: {mapModel.toggle = "S"}) {
                Text("Selected")
            }
            .buttonStyle(StyledButton(backgroundColor: mapModel.toggle == "S" ? .green : .red))
            
            Button(action: {mapModel.toggle = "F"}) {
                Text("Favorite")
            }
            .buttonStyle(StyledButton(backgroundColor: mapModel.toggle == "F" ? .green : .red))
            
            Button(action: {mapModel.toggle = "C"}) {
                Text("Close")
            }
            .buttonStyle(StyledButton(backgroundColor: mapModel.toggle == "C" ? .green : .red))
        }
        
    }
}

#Preview {
    ToggleButtonsView()
        .environmentObject(MapModel())
}
