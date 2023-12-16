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
        
    func addTask (title: String) {
        tasks.append(
            TaskModel(
                title: title,
                isCompleted: false
            )
        )
    }
    
    func removeTask (indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    
}
