//
//  Data.swift
//  Attendance
//
//  Created by Jadon Lai on 8/24/24.
//

import Foundation
import SwiftUI
import SwiftData

@Model struct Athlete {
    var name: String
    var isPresent: Bool
    
    init(name: String, isPresent: Bool) {
        self.name = name
        self.isPresent = isPresent
    }
}
