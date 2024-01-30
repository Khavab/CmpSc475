//
//  PickerView.swift
//  LionSpell
//
//  Created by Shibli Nomani on 1/26/24.
//

import SwiftUI

struct PickerView<SelectionValue: Identifiable & Hashable>: View where SelectionValue: RawRepresentable, SelectionValue.RawValue == String {
    @Binding var selection: SelectionValue
    var options: [SelectionValue]
    
    var body: some View {
        Picker("Select", selection: $selection) {
            ForEach(options, id: \.id) { option in
                Text(option.rawValue.capitalized).tag(option)
            }
        }
        .pickerStyle(.segmented)
    }
}
