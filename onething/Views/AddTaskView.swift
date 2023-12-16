//
//  AddTaskView.swift
//  onething
//
//  Created by Vaibhav Udaywal on 17/12/23.
//

import SwiftUI

struct AddTaskView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var taskInput: String = ""

    var body: some View {
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
                    createTask()
                }
            Button(
                action: createTask,
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
                    createTask()
                }

        }
        .padding(14)
    }
    
    func createTask () {
        if isTaskInputValid(taskInput: taskInput) {
            listViewModel.addTask(title: self.taskInput)
        }
        self.taskInput = ""
    }
    
    func isTaskInputValid (taskInput: String) -> Bool {
        let trimmedInput = taskInput.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmedInput.count < 3 {
            return false
        }
        return true
    }
    
}

//#Preview {
//    ListView()
//        .environmentObject(ListViewModel())
//}
