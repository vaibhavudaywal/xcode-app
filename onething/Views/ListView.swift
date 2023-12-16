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
        if isTaskInputValid() {
            taskStore.tasks.append(
                Task(
                    id: String(taskStore.tasks.count + 1),
                    text: taskInput
                )
            )
            self.taskInput = ""
        }
    }
    
    func onTaskDelete (at offsets: IndexSet) {
        taskStore.tasks.remove(atOffsets: offsets)
    }
    
    func isTaskInputValid () -> Bool {
        let trimmedInput = self.taskInput.trimmingCharacters(in: .whitespacesAndNewlines)
        return !trimmedInput.isEmpty
    }
    
    var searchBar: some View {
        HStack {
            TextField(
                "New task here...",
                text: $taskInput
            )
            .textFieldStyle(PlainTextFieldStyle())
            .padding(.horizontal)
            .frame(height: 28)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(10)
            .onSubmit {
                self.addNewTask()
            }
            Button(
                action: self.addNewTask,
                label: {
                    Text("Add".uppercased())
                }
            )
            .buttonStyle(PlainButtonStyle())
            .frame(height: 28)
            .frame(width: 60)
            .background(Color.accentColor)
            .cornerRadius(10)
            .onTapGesture {
                self.addNewTask()
            }

        }       
        .padding(14)
    }
    
    var body: some View {
        searchBar
        VStack {
            Text ("To do list")
            List {
                ForEach (self.taskStore.tasks) {
                    task in ListRowView(title: task.text)
                }.onDelete(perform: onTaskDelete(at:))
            }
            .listStyle(PlainListStyle())
        }
    }
    
}


#Preview {
    ListView()
}


