//
//  ViewModel.swift
//  TaskFlow
//
//  Created by Dima on 24.08.2023.
//

import Foundation

class ViewModel: ObservableObject {
    let keyUD = "keyUD"
    @Published var tasks: [TaskModel] = [] {
        didSet {
            saveTasks()
        }
    }
    
    init() {
        getTasks()
    }
    
    func addTask(task: String) {
        tasks.append(TaskModel(name: task, isCompleted: false))
    }
    
    func delete(task: IndexSet) {
        tasks.remove(atOffsets: task)
    }
    
    func move(task: IndexSet, to: Int) {
        tasks.move(fromOffsets: task, toOffset: to)
    }
    
    func isCompleted(task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            var newTask = task
            newTask.isCompleted.toggle()
            tasks[index] = newTask
        }
    }
    
    func saveTasks() {
        if let encodeTasks = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encodeTasks, forKey: keyUD)
        }
    }
    
    func getTasks() {
        guard let data = UserDefaults.standard.data(forKey: keyUD) else { return }
        guard let decodeTasks = try? JSONDecoder().decode([TaskModel].self, from: data) else { return }
        self.tasks = decodeTasks
    }
}
