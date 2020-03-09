//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Jia H Li on 2/7/20.
//  Copyright © 2020 Jia H Li. All rights reserved.
//

import Foundation

struct ToDoItem: Codable {
    var name: String
    var date: Date
    var notes: String
    var reminderSet: Bool
    var notificationID: String?
    var completed: Bool
}
