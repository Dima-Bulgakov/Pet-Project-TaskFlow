//
//  TaskRowView.swift
//  TaskFlow
//
//  Created by Dima on 24.08.2023.
//

import SwiftUI

struct TaskRowView: View {
    
    var taskModel: TaskModel
    let toggleCompletion: () -> Void
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                            .fill(Color("TextField"))
                            .frame(height: 55)
                    
            HStack {
                Text(taskModel.name)
                    .strikethrough(taskModel.isCompleted)
                    .lineLimit(2)
                    .foregroundColor(Color("Font"))
                Spacer()
                Image(systemName: taskModel.isCompleted ? "checkmark.circle" : "circle")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(taskModel.isCompleted ? .accentColor : .secondary)
                    .onTapGesture {
                        toggleCompletion()
                    }
            }
            .padding(.horizontal)
        }
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
    }
}

struct TaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        let toggleCompletion: () -> Void = {}
        NavigationView {
            ZStack {
                Background()
                List {
                    TaskRowView(taskModel: TaskModel(name: "First", isCompleted: false), toggleCompletion: toggleCompletion)
                        .listRowBackground(Color.clear)
                    TaskRowView(taskModel: TaskModel(name: "First Task", isCompleted: true), toggleCompletion: toggleCompletion)
                        .listRowBackground(Color.clear)
                }
                .listStyle(GroupedListStyle())
                .scrollContentBackground(.hidden)
            }
        }
        .environmentObject(ViewModel())
    }
}
