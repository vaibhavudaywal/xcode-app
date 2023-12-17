//
//  ListRowView.swift
//  onething
//
//  Created by Vaibhav Udaywal on 16/12/23.
//

import SwiftUI

struct ListRowView: View {

    var task: TaskModel
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(task.isCompleted ? .green : .red)
                .onTapGesture {
                    listViewModel.updateTask(task: task)
                }
            Text(task.title)
            Spacer()
            Image(systemName: "trash")
                .onTapGesture {
                    listViewModel.removeTask(task: task)
                }
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 5)
    }
}
