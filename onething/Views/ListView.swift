//
//  ContentView.swift
//  onething
//
//  Created by Vaibhav Udaywal on 07/12/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        AddTaskView()
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
    
}


#Preview {
    ListView()
        .environmentObject(ListViewModel())
}

