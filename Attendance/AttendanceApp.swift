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
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Student.self)
    }
}
