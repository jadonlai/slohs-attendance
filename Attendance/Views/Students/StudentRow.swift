//
//  StudentRow.swift
//  Attendance
//
//  Created by Jadon Lai on 8/22/24.
//

import SwiftUI

struct StudentRow: View {
    var student: Student
    
    var body: some View {
        HStack {
            Text(student.name)
            Spacer()
            if student.isPresent {
                Image(systemName: "person.fill.checkmark")
                    .foregroundStyle(.green)
            } else {
                Image(systemName: "person.fill.xmark")
                    .foregroundStyle(.red)
            }
        }
    }
}

#Preview {
    let students = ModelData().students
    return Group {
        StudentRow(student: students[0])
        StudentRow(student: students[1])
    }
}
