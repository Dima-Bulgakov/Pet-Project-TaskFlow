//
//  EditTaskView.swift
//  TaskFlow
//
//  Created by Dima on 25.08.2023.
//

import SwiftUI

struct EditTaskView: View {

    @EnvironmentObject var viewModel: ViewModel
    @Environment (\.dismiss) private var dismiss
    @State private var editeTask: String
    var taskModel: TaskModel

    init(task: TaskModel) {
        self.taskModel = task
        _editeTask = State(initialValue: task.name)
    }

    var body: some View {
        ZStack {
            Background()
            ScrollView {
                
                VStack(alignment: .leading) {
                    Text("Edit\nYour Task".uppercased())
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(.secondary).opacity(0.5)
                        
                    
                    TextField("Edit your task", text: $editeTask)
                        .padding(.horizontal)
                        .frame(height: 55)
                        .background(.background)
                        .cornerRadius(10)
                    Button {
                        if let index = viewModel.tasks.firstIndex(where: { $0.id == taskModel.id }) {
                            viewModel.tasks[index].name = editeTask
                        }
                        dismiss()
                    } label: {
                        Text("Save Task")
                            .foregroundColor(Color(UIColor.secondarySystemBackground))
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)

                            .background(LinearGradient(
                                gradient: Gradient(colors: [.accentColor, Color("SecondaryAccentColor")]),
                                startPoint: .leading,
                                endPoint: .trailing))
                            .cornerRadius(10)
                    }
                    
                }
                .padding()
                .padding(.top, 30)
            }
            
        }
    }
    
}


struct EditTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditTaskView(task: TaskModel(name: "", isCompleted: false))
        }
        .environmentObject(ViewModel())
    }
}
