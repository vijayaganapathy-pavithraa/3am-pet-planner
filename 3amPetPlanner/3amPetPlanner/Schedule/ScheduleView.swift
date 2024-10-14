//
//  ContentView.swift
//  3rdtry3amApp
//
//  Created by Lili Y on 19/7/24.
//

import SwiftUI

struct ScheduleView: View {
    @StateObject private var viewModel = TaskViewModel()
    @State private var showingAddTaskSheet = false
    
    var body: some View {
        VStack {
            DatePicker("Select Date", selection: $viewModel.selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
            
            List {
                ForEach(viewModel.tasks[viewModel.selectedDate] ?? []) { task in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(task.title)
                                .strikethrough(task.isDone)
                            Text("\(task.time, formatter: taskTimeFormatter)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Button(action: {
                            viewModel.toggleTaskDone(task: task, for: viewModel.selectedDate)
                        }) {
                            Image(systemName: task.isDone ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(task.isDone ? .green : .gray)
                        }
                    }
                }
                .onDelete { offsets in
                    viewModel.deleteTask(at: offsets, for: viewModel.selectedDate)
                }
            }
        }
        .navigationTitle("Schedule")
        .navigationBarItems(trailing: Button(action: {
            showingAddTaskSheet.toggle()
        }) {
            Image(systemName: "plus")
                .bold()
        })
        .sheet(isPresented: $showingAddTaskSheet) {
            AddTaskView(viewModel: viewModel, selectedDate: viewModel.selectedDate)
        }
    }
}

#Preview {
    ScheduleView()
}
