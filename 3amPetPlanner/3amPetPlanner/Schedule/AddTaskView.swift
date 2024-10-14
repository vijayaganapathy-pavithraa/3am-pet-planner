//
//  AddTaskView.swift
//  3rdtry3amApp
//
//  Created by Lili Y on 19/7/24.
//

import SwiftUI

struct AddTaskView: View {
    
@ObservedObject var viewModel: TaskViewModel
 @State private var taskTitle = ""
 @State private var taskTime = Date()
 @Environment(\.presentationMode) var presentationMode
 var selectedDate: Date
 
 var body: some View {
     NavigationView {
         Form {
             Section(header: Text("Task Details")) {
                 TextField("Task Title", text: $taskTitle)
                 DatePicker("Task Time", selection: $taskTime, displayedComponents: .hourAndMinute)
             }
             
             Button("Add Task") {
                 guard !taskTitle.isEmpty else { return }
                 viewModel.addTask(title: taskTitle, time: taskTime, for: selectedDate)
                 presentationMode.wrappedValue.dismiss()
             }
         }
         .navigationTitle("New Task")
     }
 }
}

let taskTimeFormatter: DateFormatter = {
 let formatter = DateFormatter()
 formatter.timeStyle = .short
 return formatter
}()

#Preview {
    AddTaskView(viewModel: TaskViewModel(), selectedDate: Date())
}
