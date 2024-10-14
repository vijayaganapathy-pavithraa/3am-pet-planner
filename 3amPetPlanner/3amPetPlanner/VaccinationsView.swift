//
//  ContentView.swift
//  Medical Interface for Dog App
//
//  Created by Ng Yahn Heng, Samuel on 19/07/R6.
//



import SwiftUI



struct VaccinationsView: View {
    @State var showEditSheet = false //variable to show the sheet
    @State var vaccines: [Vaccines] = [] //array of vaccines
    @State var restorationToggle:Bool = false
    var body: some View {
        NavigationStack {
            List{
                
                Section(header: Text("Vaccines Taken")){
                    ForEach($vaccines) { $vaccine in //iterate through the array
                        if vaccine.vaccineTaken == "Yes"{
                            Text(vaccine.title)
                                .swipeActions{
                                    Button("Remove from view"){
                                        //print("Toggle")
                                        //Replace with actual toggle
                                        vaccine.vaccineTaken = "Hidden"
                                        restorationToggle.toggle()
                                        
                                    }
                                    .tint(.red)
                                }
                        }
                    }
                }
                
                Section(header: Text("Vaccines to take")){
                    ForEach($vaccines) { $vaccine in //iterate through the array
                        if vaccine.vaccineTaken == "No"{
                            Text(vaccine.title)
                                .swipeActions{
                                    Button("Completed!"){
                                        //print("Toggle")
                                        //Replace with actual toggle
                                        vaccine.vaccineTaken = "Yes"
                                    }
                                    .tint(.green)
                                }
                        }
                    }
                }
                
                Button{
                    showEditSheet = true
                } label: {
                    Text("Add Vaccines")
                }
                .sheet(isPresented: $showEditSheet, onDismiss: didDismissVaccinesSheet) {                AddVaccinesView(vaccines: $vaccines) //connecting the binding in the other view to this view
                }
                
            }
            .navigationTitle("Vaccines")
            
            //            if restorationToggle {
            //                Text("Deleted entry: restore?")
            //                Button{
            //                    
            //                } label: {
            //                    Text("Restore")
            //                }
            
            
        }
    }
}
func didDismissVaccinesSheet(){
    //Do y'all know what this is for?
}

#Preview {
    VaccinationsView()
}
