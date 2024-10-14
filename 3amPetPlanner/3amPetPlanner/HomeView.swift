//
//  ContentView.swift
//  homeUIPetplanner
//
//  Created by Sarah Si Hui Tan on 20/7/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
                List {
                    Section {
                        NavigationLink{
                            FeedView()
                        }label:{
                            HStack{
                                Text("Food")
                                    .font(.largeTitle)
                                    .font(.custom("SFPro",fixedSize: 36))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.pink)
                                Image(systemName: "fork.knife.circle")
                                    .font(.custom("SFPro",fixedSize: 36))
                                    .foregroundStyle(.pink)
                            }
                            .padding(1.5)
                        }
                        .listRowBackground(Color.pinkHomeView)
                        .foregroundStyle(.pink)
                    }
                    
                    
                    Section {
                        HStack{
                            NavigationLink{
                                ScheduleView()
                            }label:{
                                Text("Schedule")
                                    .font(.largeTitle)
                                    .font(.custom("SFPro",fixedSize: 36))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.gray)
                                Image(systemName: "calendar")
                                    .font(.custom("SFPro",fixedSize: 36))
                                    .foregroundStyle(.gray)
                            }
                        }
                        .listRowBackground(Color.greyhomeView)
                        
                    }
                    Section {
                        HStack{
                            NavigationLink{
                                VaccinationsView()
                            }label:{
                                Text("Vaccines")
                                    .font(.largeTitle)
                                    .font(.custom("SFPro",fixedSize: 36))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.greenText)
                                Image(systemName: "syringe")
                                    .font(.custom("SFPro",fixedSize: 36))
                                    .foregroundStyle(.greenText)
                            }
                        }
                    }
                    .listRowBackground(Color.greenHomeView)
                    
                }
                .navigationTitle("Home")
        }
    }
}
    #Preview {
        HomeView()
    }
    
