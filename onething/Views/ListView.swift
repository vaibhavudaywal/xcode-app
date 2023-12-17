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
        VStack {
            AddTaskView()
            List {
                ForEach (listViewModel.tasks) {
                    task in ListRowView(task: task)
                }
            }
            .listStyle(PlainListStyle())
            .padding(.horizontal)
            .padding(.bottom, 20)
            .cornerRadius(-10)
        }
    }
    
}


#Preview {
    ListView()  
        .environmentObject(ListViewModel())
}

