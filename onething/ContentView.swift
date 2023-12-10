//
//  ContentView.swift
//  onething
//
//  Created by Vaibhav Udaywal on 07/12/23.
//

import SwiftUI

struct Task: Identifiable, Equatable {
    var id = UUID()
    var text: String
    var isChecked: Bool = false
}

class TaskManager: ObservableObject {
    @Published var tasks: [Task] = []
    
    func addTask(text: String) {
        tasks.append(Task(text: text))
    }
    
    func removeTask(at index: Int) {
        tasks.remove(at: index)
    }
    
    func toggleTask(at index: Int) {
        tasks[index].isChecked.toggle()
    }
}

struct ContentView: View {
    @ObservedObject var taskManager: TaskManager
    @Binding var newTaskText: String
    
    var body: some View {
        VStack {
            HStack {
                TextField("Add a task", text: $newTaskText, onCommit: {
                    taskManager.addTask(text: newTaskText)
                    newTaskText = ""
                })
                Button("Add") {
                    taskManager.addTask(text: newTaskText)
                    newTaskText = ""
                }
            }.padding()

            List {
                ForEach(taskManager.tasks) { task in
                    HStack {
                        Image(systemName: task.isChecked ? "checkmark.square" : "square")
//                            .onTapGesture {
//                                if let index = taskManager.tasks.firstIndex(where: { $0.id == task.id }) {
//                                    taskManager.toggleTask(at: index)
//                                }
//                            }
                        Text(String(task.text))

//                        Spacer()

                        if !task.isChecked {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
//                                .onTapGesture {
//                                    if let index = taskManager.tasks.firstIndex(where: { $0.id == task.id }) {
//                                        taskManager.removeTask(at: index)
//                                    }
//                                }
                        }
                    }
                }
            }
            .padding()
        }
        .frame(width: 300, height: 300)
    }
    
    init(taskManager: TaskManager = TaskManager(), newTaskText: Binding<String> = .constant("")) {
        self.taskManager = taskManager
        self._newTaskText = newTaskText
    }
}


#Preview {
    ContentView(newTaskText: .constant(""))
}
