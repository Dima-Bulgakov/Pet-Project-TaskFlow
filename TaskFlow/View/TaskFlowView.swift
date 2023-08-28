//
//  TaskFlowView.swift
//  TaskFlow
//
//  Created by Dima on 24.08.2023.
//

import SwiftUI

struct TaskFlowView: View {
    
    var body: some View {
        TabView {
            TaskListView()
                .tabItem {
                    Image(systemName: "note.text")
                    Text("Task")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Task")
                }
        }
    }
}

struct TaskFlowView_Previews: PreviewProvider {
    static var previews: some View {
        TaskFlowView()
    }
}
