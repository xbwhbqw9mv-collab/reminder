//
//  ScheduledDetailView.swift
//  reminder
//
//  Created by Aida Mohammadi on 10/11/25.
//

import SwiftUI

struct ScheduledDetailView: View {
    @State private var searchText = ""
    
    // Sample data for the scheduled view, grouped by date
    let scheduledDates: [String: [ScheduledReminder]] = [
        "Today": [
            .init(title: "Call insurance company", listName: "Personal")
        ],
        "Tomorrow": [], // Empty section
        "Sun Nov 9": [
            .init(title: "Pick up dry cleaning", listName: "Errands"),
            .init(title: "Send monthly report", listName: "Work")
        ],
        "Rest of November": [
            .init(title: "Buy Christmas gifts", listName: "Personal")
        ],
        "December, 2026": [],
        "January, 2026": [],
        "February, 2026": [],
        "March, 2026": [],
        "April, 2026": [],
        "May, 2026": [],
        "June, 2026": []
    ]
    
    var sortedDates: [String] {
        return scheduledDates.keys.sorted { $0.count < $1.count } // Simple sorting for demonstration
    }
    
    var body: some View {
        // List makes the page scrollable
        List {
            // Main content rows
            ForEach(sortedDates, id: \.self) { date in
                Section {
                    // Check if the section has reminders or is just a date title
                    if let reminders = scheduledDates[date], !reminders.isEmpty {
                        ForEach(reminders) { reminder in
                            // A simple button makes the reminder item clickable
                            Button {
                                print("Tapped reminder: \(reminder.title)")
                            } label: {
                                HStack {
                                    Image(systemName: "circle") // Empty circle icon
                                        .foregroundColor(.gray)
                                    Text(reminder.title)
                                    Spacer()
                                    // Optional: show list name or details
                                }
                                .contentShape(Rectangle()) // Makes the whole row tappable
                            }
                            .buttonStyle(.plain)
                        }
                    } else {
                        // Empty row for date titles like "Tomorrow", "Sun Nov 9"
                        Text(date)
                            .font(.body)
                    }
                } header: {
                    // Only show section header if the date title is NOT the content
                    if scheduledDates[date]?.isEmpty ?? true || date == "Today" {
                        Text(date)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(date == "Scheduled" || date == "Today" ? .red : .primary)
                            .textCase(nil) // Prevent ALL CAPS
                    }
                }
            }
        }
        .navigationTitle("Scheduled")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    print("Tapped options menu on Scheduled View")
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
            }
        }
    }
}
