//
//  ContentView.swift
//  onething
//
//  Created by Vaibhav Udaywal on 07/12/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var taskInput: String = ""

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
    
    var body: some View {
        searchBar
        VStack {
            List {
                ForEach (listViewModel.tasks) {
                    task in ListRowView(task: task)
                }
                .onDelete(perform: listViewModel.removeTask)
            }
            .listStyle(PlainListStyle())
            .padding(.horizontal)
        }
    }
    
    func createTask () {
        listViewModel.addTask(taskInput: self.taskInput)
    }
    
}


#Preview {
    ListView()
        .environmentObject(ListViewModel())
}

