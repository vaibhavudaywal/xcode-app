//
//  ListRowView.swift
//  onething
//
//  Created by Vaibhav Udaywal on 16/12/23.
//

import SwiftUI

struct ListRowView: View {

    var task: TaskModel
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(task.isCompleted ? .green : .red)
            Text(task.title)
            Spacer()
        }
//        .font(.title3)
        .padding(.vertical, 5)
    }
}


//struct ListRowView_Previews: PreviewProvider {
//    // Example task for preview
//    static let exampleTasks: [TaskModel] = [
//        TaskModel(title: "First task", isCompleted: false),
//        TaskModel(title: "Second task", isCompleted: true)
//    ]
//    
//    static var previews: some View {
//        return ForEach(exampleTasks) {
//            task in ListRowView(task: task)
//        }
////        .previewLayout(.fixed(width: 300, height: 50)) // Adjust width and height as needed
//    }
//}
