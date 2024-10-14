//
//  DataSchedule.swift
//  3rdtry3amApp
//
//  Created by Lili Y on 19/7/24.
//

import Foundation
import UserNotifications

struct ScheduleTask: Identifiable {
    let id = UUID()
    var title: String
    var time: Date
    var isDone: Bool
}

class TaskViewModel: ObservableObject {
    @Published var tasks: [Date: [ScheduleTask]] = [:]
    @Published var selectedDate: Date = Date()
    
    init() {
        requestNotificationPermissions()
    }
    
    func requestNotificationPermissions() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Error requesting notification permissions: \(error)")
            }
        }
    }
    
    func addTask(title: String, time: Date, for date: Date) {
        let task = ScheduleTask(title: title, time: time, isDone: false)
        if tasks[date] != nil {
            tasks[date]?.append(task)
        } else {
            tasks[date] = [task]
        }
        scheduleNotification(for: task, on: date)
    }
    
    func deleteTask(at offsets: IndexSet, for date: Date) {
        if let index = offsets.first {
            tasks[date]?.remove(at: index)
        }
    }
    
    func toggleTaskDone(task: ScheduleTask, for date: Date) {
        if let index = tasks[date]?.firstIndex(where: { $0.id == task.id }) {
            tasks[date]?[index].isDone.toggle()
        }
    }
    
    private func scheduleNotification(for task: ScheduleTask, on date: Date) {
        let content = UNMutableNotificationContent()
        content.title = task.title
        content.body = "It's time for your task."
        content.sound = .default
        
        var dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: task.time)
        dateComponents.year = Calendar.current.component(.year, from: date)
        dateComponents.month = Calendar.current.component(.month, from: date)
        dateComponents.day = Calendar.current.component(.day, from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let request = UNNotificationRequest(identifier: task.id.uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error)")
            }
        }
    }
}
