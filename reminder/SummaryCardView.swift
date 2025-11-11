//
//  SummaryCardView.swift
//  reminder
//
//  Created by Aida Mohammadi on 10/11/25.
//

import SwiftUI


let summaryList: [ReminderList] = [
    .init(name: "Today", count: 0, icon: "10.calendar", color: .blue, isCompleted: false),
    .init(name: "Scheduled", count: 0, icon: "calendar", color: .red, isCompleted: false),
    .init(name: "All", count: 0, icon: "tray", color: .black, isCompleted: false),
    .init(name: "Completed", count: 0, icon: "checkmark", color: .gray, isCompleted: true)
]
struct SummaryCardView: View {
    let list: ReminderList
    
    var body: some View {
        NavigationLink {
            // Destination depends on the card type
            if list.name == "Scheduled" {
                ScheduledDetailView()
            } else {
                ListDetailView(list: list)
            }
        } label: {
            
            // Use ZStack to layer the gradient BEHIND the content
            ZStack(alignment: .topLeading) { // Align content to the top-left
                
                // --- BACKGROUND LAYER ---
                // This gradient is more vibrant and "Apple-like".
                // It goes from the list color to a darker, semi-transparent black.
                LinearGradient(
                    gradient: Gradient(colors: [list.color, .black.opacity(0.1)]),
                    startPoint: .trailing, // Start at top-left
                    endPoint: .leading // End at bottom-right
                )
                
                // --- CONTENT LAYER ---
                // This is your original VStack with content
                VStack(alignment: .leading, spacing: 5) {
                    HStack(alignment: .top) {
                        
                        // We give the icon its own subtle background
                        // to make it "pop" from the card's gradient.
                        Image(systemName: list.icon)
                            .font(.title3) // Slightly smaller
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(8)
                            // This semi-transparent background is key
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
                        // Using slightly transparent white looks cleaner
                        .foregroundColor(.white.opacity(0.9))
                }
                .padding(12) // Add padding *inside* the ZStack
            }
            .frame(height: 100) // Constrain the height of the ZStack
            .cornerRadius(24) // Round the corners of the ZStack
        }
        .buttonStyle(.plain) // Essential to remove the blue link tint
    }
}

#Preview {
    ForEach(summaryList) { list in
        SummaryCardView(list: list) // Now fully clickable
    }
}
