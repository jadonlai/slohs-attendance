//
//  StudentView.swift
//  Attendance
//
//  Created by Jadon Lai on 8/24/24.
//

import SwiftUI
import SwiftData

struct StudentView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.colorScheme) var colorScheme
    @Query(sort: [SortDescriptor(\Student.firstName), SortDescriptor(\Student.lastName)]) var students: [Student]
    @State private var showAllStudents = false
    
    var filteredStudents: [Student] {
        if showAllStudents {
            return students
        } else {
            return students.filter { !$0.isPresent }
        }
    }
    
    var body: some View {
        VStack {
            Button(action: {
                markAllNotPresent()
            }) {
                Text("Reset")
                    .foregroundStyle(colorScheme == .light ? .black : .white)
            }
            .buttonStyle(.bordered)
            Toggle(isOn: $showAllStudents) {
                Text("Show All Students")
            }
            .padding(.horizontal)
            List {
                ForEach(filteredStudents) { student in
                    Button(action: {
                        markPresent(student)
                    }) {
                        HStack {
                            Text("\(student.firstName) \(student.lastName)")
                                .font(.subheadline)
                                .foregroundStyle(colorScheme == .light ? .black : .white)
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
                .onDelete(perform: deleteStudent)
            }
            .animation(.default, value: filteredStudents)
        }
    }
    
    init(sort: SortDescriptor<Student>, searchString: String) {
        _students = Query(filter: #Predicate {
            if searchString.isEmpty {
                return true
            } else {
                return $0.firstName.localizedStandardContains(searchString)
            }
        }, sort: [sort])
    }
    
    func deleteStudent(_ indexSet: IndexSet) {
        for index in indexSet {
            let student = students[index]
            modelContext.delete(student)
        }
    }
    
    func markPresent(_ student: Student) {
        student.isPresent = !student.isPresent
    }
    
    func markAllNotPresent() {
        for student in students {
            student.isPresent = false
        }
    }
}

#Preview {
    StudentView(sort: SortDescriptor(\Student.firstName), searchString: "")
}
