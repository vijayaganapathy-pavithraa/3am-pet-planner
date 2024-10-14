//
//  FeedView.swift
//  petPlanner3AM
//
//  Created by Vijayaganapathy Pavithraa on 20/7/24.
//


import SwiftUI

struct FeedView: View {
    
    @State private var showSheet = false
    @State private var items = [
        "Chocolate",
        
    ]
    
    @State private var newFact = ""
    
    var body: some View {
        List {
            Section(header: HStack {
                Text("Allergies")
                    .font(.headline)
                    .bold()
                Spacer()
                Button(action: {
                    showSheet = true
                }) {
                    Image(systemName: "plus")
                }
            }
                .padding(.top, 10)) {
                    ForEach(items, id: \.self) { item in
                        Text(item)
                    }
                    
                }
                .padding(.top, 10)
            
            Section(header: Text("Suggested")
                .font(.headline)
                .bold()) {
                    Text("Chicken")
                    Text("Beef")
                    Text("Lamb")
                    Text("Tomato")
                }
        }
        .navigationTitle("Food")
        .sheet(isPresented: $showSheet) {
            VStack {
                TextField("Enter New Allergy", text: $newFact)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(8)
                Button{
                    if !newFact.isEmpty {
                        items.append(newFact)
                        showSheet = false
                        newFact = ""
                    }
                }label:{
                    Text("Save")
                }
                .presentationDetents([.medium, .large])
            }
            .padding()
        }
    }
}

#Preview {
    FeedView()
}
