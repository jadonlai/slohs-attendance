//
//  Student.swift
//  Attendance
//
//  Created by Jadon Lai on 8/22/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct Student: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var isPresent: Bool
}
