//
//  SyncAlertView.swift
//  reminder
//
//  Created by Aida Mohammadi on 10/11/25.
//

import SwiftUI

struct SyncAlertView: View {
    @State private var isDismissed = false
    
    var body: some View {
        if !isDismissed {
            VStack(alignment: .leading, spacing: 10) {
                HStack(alignment: .top) {
                    Image(systemName: "cloud")
                        .font(.title3)
                        .foregroundColor(.secondary)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Sync Reminders with iCloud")
                            .fontWeight(.medium)
                        Text("To access your reminders on all of your devices, sign into iCloud and enable Reminders.")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    
                    Button {
                        withAnimation { isDismissed = true }
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.secondary)
                    }
                }
                
                Button("Go to Settings") {
                    print("Tapped Go to Settings")
                }
            }
            .padding()
            .background(Color(.systemGray6)) // Light gray background
            .cornerRadius(12)
            .padding(.horizontal)
            .padding(.vertical, 10)
        }
    }
}
