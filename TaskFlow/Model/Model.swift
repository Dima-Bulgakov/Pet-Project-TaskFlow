//
//  Model.swift
//  TaskFlow
//
//  Created by Dima on 24.08.2023.
//

import Foundation

struct TaskModel: Identifiable, Codable {
    var id = UUID()
    var name: String
    var isCompleted: Bool
}
