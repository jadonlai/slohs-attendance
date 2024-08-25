//
//  ContentView.swift
//  Attendance
//
//  Created by Jadon Lai on 8/22/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var path = [Student]()
    @State private var sortOrder = SortDescriptor(\Student.firstName)
    @State private var searchText = ""

    var body: some View {
        NavigationStack(path: $path) {
            StudentView(sort: sortOrder, searchString: searchText)
                .navigationDestination(for: Student.self, destination: EditStudentView.init)
                .navigationTitle("Attendance")
                .searchable(text: $searchText)
                .toolbar {
                    Button("Add Student", systemImage: "plus", action: addStudent)
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("First Name")
                                .tag(SortDescriptor(\Student.firstName))
                            Text("Last Name")
                                .tag(SortDescriptor(\Student.lastName))
                        }
                        .pickerStyle(.inline)
                    }
                }
        }
    }
    
    func addStudent() {
        let student = Student()
        modelContext.insert(student)
        path = [student]
    }
}

#Preview {
    ContentView()
}
