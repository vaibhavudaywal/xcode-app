//
//  TodoModel.swift
//  onething
//
//  Created by Vaibhav Udaywal on 10/12/23.
//

import Foundation
import SwiftUI

// Added Identifiable to make sure the struct is iterable
struct TaskModel: Identifiable {
    let id: String // because it shouldn't change
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func toggleTask () -> TaskModel {
        return TaskModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
