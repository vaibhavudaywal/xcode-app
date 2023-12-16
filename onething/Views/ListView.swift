//
//  ContentView.swift
//  onething
//
//  Created by Vaibhav Udaywal on 07/12/23.
//

import SwiftUI
import Combine

struct ListView: View {
    // creating variable on the basis of task we built
    @ObservedObject var taskStore = TaskStore()
    
    @State var taskInput: String = ""
    
    func addNewTask () {
        taskStore.tasks.append(
            Task(
                id: String(taskStore.tasks.count + 1),
                text: taskInput
            )
        )
        self.taskInput = ""
    }
    
    func onTaskDelete (at offsets: IndexSet) {
        taskStore.tasks.remove(atOffsets: offsets)
    }
    
    var searchBar: some View {
        HStack {
            TextField("add a new task", text: self.$taskInput)
            Button(action: self.addNewTask, label: {
                Text("Add new")
            })
        }
    }
    
    var body: some View {
        searchBar
        VStack {
            Text ("To do list")
            List {
                ForEach (self.taskStore.tasks) {
                    task in Text(task.text)
                }.onDelete(perform: onTaskDelete(at:))
            }
        }
    }
}


//#Preview {
//    ListView()
//}
