//
//  TodoModel.swift
//  onething
//
//  Created by Vaibhav Udaywal on 10/12/23.
//

import Foundation
import SwiftUI
// help us to combine information from one file to another
import Combine


struct Task: Identifiable {
    var id: String = ""
    var text: String = ""
}

class TaskStore: ObservableObject {
    @Published var tasks: [Task] = []
}
