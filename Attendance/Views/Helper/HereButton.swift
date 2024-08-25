//
//  HereButton.swift
//  Attendance
//
//  Created by Jadon Lai on 8/24/24.
//

import SwiftUI

struct HereButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Attendance", systemImage: isSet ? "person.fill.checkmark" : "person.fill.xmark")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .green : .red)
        }
    }
}

#Preview {
    HereButton(isSet: .constant(true))
}
