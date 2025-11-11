//
//  ListRowView.swift
//  reminder
//
//  Created by Aida Mohammadi on 10/11/25.
//

import SwiftUI

struct ListRowView: View {
    let list: ReminderList
    
    var body: some View {
        // NavigationLink makes the row clickable and pushes to a list detail view
        NavigationLink {
            ListDetailView(list: list)
        } label: {
            HStack {
                HStack(spacing: 12) {
                    Image(systemName: "list.bullet")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Circle().fill(list.color))
                    
                    Text(list.name)
                }
                Spacer()
                Text("\(list.count)")
                    .foregroundColor(.secondary)
            }
        }
    }
}
