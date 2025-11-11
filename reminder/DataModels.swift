//
//  DataModels.swift
//  reminder
//
//  Created by Aida Mohammadi on 10/11/25.
//

import Foundation
import SwiftUI

struct ReminderList: Identifiable {
    let id = UUID()
    let name: String
    let count: Int
    let icon: String // SF Symbols name
    let color: Color
    let isCompleted: Bool
}

struct ListSection: Identifiable {
    let id = UUID()
    let name: String
    let lists: [ReminderList]
}

struct ScheduledReminder: Identifiable {
    let id = UUID()
    let title: String
    let listName: String
}
