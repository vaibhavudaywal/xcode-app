//
//  ListViewModel.swift
//  onething
//
//  Created by Vaibhav Udaywal on 16/12/23.
//

import Foundation

class ListViewModel: ObservableObject {
    
    // we can't use @State in regular class only in View
    @Published var tasks: [TaskModel] = []
    
    init() {
        getTasks()
    }
    
    func getTasks() {
        // todo: service logic goes here
    }
    
    func isTaskInputValid (taskInput: String) -> Bool {
        let trimmedInput = taskInput.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmedInput.count < 3 {
            return false
        }
        return !trimmedInput.isEmpty
    }
    
    func addTask (taskInput: String) {
        if isTaskInputValid(taskInput: taskInput) {
            tasks.append(
                TaskModel(
                    title: taskInput,
                    isCompleted: false
                )
            )
        }
    }
    
    func removeTask (indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    
}
