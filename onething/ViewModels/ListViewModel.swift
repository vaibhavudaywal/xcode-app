//
//  ListViewModel.swift
//  onething
//
//  Created by Vaibhav Udaywal on 16/12/23.
//

import Foundation

class ListViewModel: ObservableObject {
    
    // we can't use @State in regular class only in View
    @Published var tasks: [TaskModel] = [] {
        // called when anytime the tasks changed
        didSet {
            saveTasks()
        }
    }
    
    let tasksKey: String = "tasks_list"
    
    init() {
        getTasks()
    }
    
    func getTasks() {
        // added guard to the data as it could come empty also
        guard 
            let data = UserDefaults.standard.data(forKey: tasksKey),
            let savedTasks = try? JSONDecoder().decode([TaskModel].self, from: data)
        else { return }
        
        self.tasks = savedTasks
    }
        
    func addTask (title: String) {
        tasks.append(
            TaskModel(
                title: title,
                isCompleted: false
            )
        )
    }
    
    func removeTask (task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks.remove(at: index)
        }
    }
    
    func updateTask (task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index] = task.toggleTask()
        }
    }
    
    // saveItems must be called to make sure that all items saved to data store
    // 1. first approach could be to call saveItems() method in each funciton above
    // 2. Or ideal approach to call a hook to save automatically when tasks change detected
    func saveTasks () {
        if let encodeData = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encodeData, forKey: tasksKey)
        }
    }
    
}
