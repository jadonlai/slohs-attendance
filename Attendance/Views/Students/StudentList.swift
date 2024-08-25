//
//  StudentList.swift
//  Attendance
//
//  Created by Jadon Lai on 8/22/24.
//

import SwiftUI

struct StudentList: View {
    @Environment(ModelData.self) var modelData
    @State private var showHereOnly = false
    
    var filteredStudents: [Student] {
        modelData.students.filter{ student in
            (showHereOnly || !student.isPresent)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showHereOnly) {
                    Text("All students")
                }
                ForEach(filteredStudents) {student in
                    Button(action: {
                        markPresent(student)
                    }) {
                        StudentRow(student: student)
                    }
                }
            }
            .animation(.default, value: filteredStudents)
            .navigationTitle("Attendance")
        } detail: {
            Text("Select a student")
        }
    }
    
    func markPresent(_ student: Student) {
        if let index = modelData.students.firstIndex(where: { $0.id == student.id }) {
            modelData.students[index].isPresent = !modelData.students[index].isPresent
        }
    }
}

#Preview {
    StudentList()
        .environment(ModelData())
}
