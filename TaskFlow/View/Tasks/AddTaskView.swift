//
//  AddTaskView.swift
//  TaskFlow
//
//  Created by Dima on 24.08.2023.
//

import SwiftUI

struct AddTaskView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    @State var newTask: String = ""
    
    var body: some View {
        ZStack {
            Background()
            ScrollView {
                VStack {
                    TextFieldForNewTask(newTask: $newTask)
                    AddTaskButton(newTask: $newTask)
                }
                .padding()
            }
        }
        .navigationTitle("addTitle")
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddTaskView()
        }
        .environmentObject(ViewModel())
    }
}

struct AddTaskButton: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @Environment (\.dismiss) private var dismiss
    @Binding var newTask: String
    
    var body: some View {
        Button {
            viewModel.addTask(task: newTask)
            dismiss()
        } label: {
            Text("addTitle")
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
}

struct TextFieldForNewTask: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @Binding var newTask: String
    
    var body: some View {
        TextField("addTextField", text: $newTask)
            .padding(.horizontal)
            .frame(height: 55)
            .background(.background)
            .cornerRadius(10)
    }
}


