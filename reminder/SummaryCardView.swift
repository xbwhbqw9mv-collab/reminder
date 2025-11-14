//
//  SummaryCardView.swift
//  reminder
//
//  Created by Aida Mohammadi on 10/11/25.
//

import SwiftUI

struct SummaryCardView: View {
    let list: ReminderList
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        // 1. --- GeometryReader has been removed ---

        ZStack(alignment: .topLeading) {
            // --- BACKGROUND LAYER ---
            LinearGradient(
                gradient: Gradient(colors: [list.color, .black.opacity(0.1)]),
                startPoint: .trailing,
                endPoint: .leading
            )
            
//            Button {
//                isPresented.toggle()}
            label: do {
                VStack(alignment: .leading, spacing: 5) {
                    HStack(alignment: .top) {
                        Image(systemName: list.icon)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.white.opacity(0.15))
                            .clipShape(Circle())
                        
                        Spacer()
                        
                        Text("\(list.count)")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                    }
                    
                    Spacer() // Pushes name to the bottom
                    
                    Text(list.name)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.white.opacity(0.9))
                }
                .padding(12)
            }

            // --- CONTENT LAYER ---
           
        }
        // 2. --- Only set the height. Let the parent control the width. ---
        .frame(height: 100)
        .cornerRadius(24)
        
        .navigationDestination(isPresented: $isPresented) {
            ListDetailView(list: list)
        }
        
//        .background(
//            NavigationLink {
//                // --- THIS IS THE FIX ---
//                // Trim whitespace from the name before checking it
//                let trimmedName = list.name.trimmingCharacters(in: .whitespacesAndNewlines)
//
//                if trimmedName == "Scheduled" {
//                    ScheduledDetailView()
//                } else {
//                    ListDetailView(list: list)
//                }
//            } label: {
//                EmptyView()
//            }
//            .opacity(0)
//        )
    }
}

#Preview {
    let summaryList: [ReminderList] = [
        .init(name: "Today", count: 0, icon: "10.calendar", color: .blue, isCompleted: false),
        .init(name: "Scheduled", count: 0, icon: "calendar", color: .red, isCompleted: false),
        .init(name: "All", count: 0, icon: "tray", color: .black, isCompleted: false),
        .init(name: "Completed", count: 0, icon: "checkmark", color: .gray, isCompleted: true)
    ]
    
    ForEach(summaryList) { list in
        SummaryCardView(list: list) // Now fully clickable
    }
}
