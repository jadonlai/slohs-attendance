//
//  AttendanceApp.swift
//  Attendance
//
//  Created by Jadon Lai on 8/22/24.
//

import SwiftUI
import SwiftData

@main
struct AttendanceApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
