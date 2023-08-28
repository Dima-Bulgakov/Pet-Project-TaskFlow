//
//  TaskFlowApp.swift
//  TaskFlow
//
//  Created by Dima on 24.08.2023.
//

import SwiftUI

@main
struct TaskFlowApp: App {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TaskListView()
                    .navigationBarTitleDisplayMode(.large)
            }
            .environmentObject(viewModel)
        }
    }
}
