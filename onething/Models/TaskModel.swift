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
    var id: String = UUID().uuidString
    var title: String = ""
    var isCompleted: Bool = false
}
