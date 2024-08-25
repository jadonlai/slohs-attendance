//
//  Student.swift
//  Attendance
//
//  Created by Jadon Lai on 8/22/24.
//

import Foundation
import SwiftData

@Model class Student {
    var firstName: String
    var lastName: String
    var isPresent: Bool
    
    init(firstName: String = "", lastName: String = "", isPresent: Bool = false) {
        self.firstName = firstName
        self.lastName = lastName
        self.isPresent = isPresent
    }
}
