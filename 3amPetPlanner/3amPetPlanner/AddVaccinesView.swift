//
//  AddVaccinesView.swift
//  3amPetPlanner
//
//  Created by Vijayaganapathy Pavithraa on 9/8/24.
//

import SwiftUI

struct AddVaccinesView: View {
    
    @Binding var vaccines: [Vaccines]
    @State private var taskTitle = ""
    var taskStatus = ["Yes","No"]
    @State private var completion = "No"
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationStack{
            Form {
                Section(header: Text("Vaccine Details")) {
                    TextField("Vaccine Title", text: $taskTitle)
                    Picker("Taken?", selection: $completion){
                        ForEach(taskStatus, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Button{
                    guard !taskTitle.isEmpty else { return }
                    presentationMode.wrappedValue.dismiss()
                    vaccines.append(Vaccines(title: taskTitle, vaccineTaken: completion))
                }label: {
                    Text("Add Vaccine")
                }
            }
            .navigationTitle("New Vaccine")
        }
    }
}

#Preview {
    AddVaccinesView(vaccines: .constant([]))
}
