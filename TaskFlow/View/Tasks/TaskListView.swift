//
//  TaskListView.swift
//  TaskFlow
//
//  Created by Dima on 24.08.2023.
//

import SwiftUI

struct TaskListView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @State private var selectedTask: TaskModel? = nil
    
    var body: some View {
        ZStack {
            Background()
            if viewModel.tasks.isEmpty {
                NoTaskView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(viewModel.tasks) { task in
                        TaskRowView(taskModel: task, toggleCompletion: {
                            viewModel.isCompleted(task: task)
                        })
                        .onTapGesture {
                            selectedTask = task
                        }
                        .fullScreenCover(item: $selectedTask) { task in
                            EditTaskView(task: task)
                                .environmentObject(viewModel)
                        }
                    }
                    .onDelete(perform: viewModel.delete)
                    .onMove(perform: viewModel.move)
                }
                .navigationTitle("Tasks")
                .listStyle(GroupedListStyle())
                .scrollContentBackground(.hidden)
                
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: NavigationLink(destination: AddTaskView(),
                                             label: {
                                                 Image(systemName: "plus")
                                             }))
            }
        }
        .navigationTitle("Tasks")
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TaskListView()
        }
        .environmentObject(ViewModel())
    }
}
