//
//  EditStudentView.swift
//  Attendance
//
//  Created by Jadon Lai on 8/24/24.
//

import SwiftUI
import SwiftData

struct EditStudentView: View {
    @Bindable var student: Student
    
    var body: some View {
        Form {
            TextField("First Name", text: $student.firstName)
            TextField("Last Name", text: $student.lastName)
        }
        .navigationTitle("Edit Student")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Student.self, configurations: config)
        let example = Student(firstName: "John", lastName: "Smith")
        return EditStudentView(student: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
