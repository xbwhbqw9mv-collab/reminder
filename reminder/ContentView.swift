//
//  ContentView.swift
//  reminder
//
//  Created by Aida Mohammadi on 06/11/25.
//

import SwiftUI

struct ContentView: View {
    // Data setup for the cards and list
    let summaryLists: [ReminderList] = [
        .init(name: "Today", count: 0, icon: "10.calendar", color: .blue, isCompleted: false),
        .init(name: "Scheduled", count: 0, icon: "calendar", color: .red, isCompleted: false),
        .init(name: "All", count: 0, icon: "tray", color: .black, isCompleted: false),
        .init(name: "Completed", count: 0, icon: "checkmark", color: .gray, isCompleted: true)
    ]
    
    let userLists: [ReminderList] = [
        .init(name: "Reminders", count: 0, icon: "list.bullet", color: .blue, isCompleted: false)
    ]
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            // List ensures the main content is scrollable
            NavigationStack {
                List {
                    // MARK: - Summary Cards Grid
                    LazyVGrid(columns: columns, spacing: 7) {
                        ForEach(summaryLists) { list in
                            SummaryCardView(list: list) // Now fully clickable
                        }
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    
                    // MARK: - Sync Alert
                    SyncAlertView()
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                        .padding(.horizontal, -20) // Extend alert to fill the list width
                    
                    // MARK: - My Lists Section
                    Section(header: Text("My Lists").font(.title3).fontWeight(.bold).textCase(nil)) {
                        ForEach(userLists) { list in
                            ListRowView(list: list) // Now fully clickable
                        }
                    }
                }
                .navigationTitle("14:39") // Use a generic title or remove if needed
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.secondary)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            Image(systemName: "square.and.arrow.up")
                                .foregroundColor(.secondary)
                            Button("Edit") {
                                print("Tapped Edit")
                            }
                        }
                    }
                }
            }
            
            // MARK: - Floating Add Button
            Button {
                print("Tapped Add New Reminder")
            } label: {
                Image(systemName: "plus")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Circle().fill(Color.blue))
                    .shadow(radius: 10)
            }
            .padding(.trailing, 20)
            .padding(.bottom, 20)
        }
    }
}


// MARK: - Preview
#Preview {
    // Start the app with the main Home View
    ContentView()
}
