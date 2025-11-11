//
//  ListDetailView.swift
//  reminder
//
//  Created by Aida Mohammadi on 10/11/25.
//

import SwiftUI

struct ListDetailView: View {
    let list: ReminderList
    
    var body: some View {
        // ScrollView is necessary if this view contains dynamic content that might overflow
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Welcome to the **\(list.name)** List!")
                    .font(.title)
                
                Text("This list currently has \(list.count) tasks.")
                    .foregroundColor(.secondary)
                
                // Placeholder content to demonstrate scrolling
                ForEach(0..<20) { i in
                    Text("Placeholder Task \(i + 1)")
                        .padding(.vertical, 5)
                }
            }
            .padding()
        }
        .navigationTitle(list.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Edit") {
                    print("Tapped Edit on \(list.name)")
                }
            }
        }
    }
}
