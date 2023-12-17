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
            if listViewModel.tasks.isEmpty {
                Spacer()
                Text("Oops! No tasks found. 😅")
                     .foregroundColor(.gray)
                     .font(.title)
                     .multilineTextAlignment(.center)
                Spacer(minLength: 5)
                Spacer()
            } else {
                List {
                    ForEach (listViewModel.tasks) {
                        task in ListRowView(task: task)
                    }
                }
                .listStyle(PlainListStyle())
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                .scrollContentBackground(.hidden)
                //            .colorMultiply(Color.clear) // if scrollContentBackground do not work
            }
        }
        .background(GlassBackground())
    }
    
}

#Preview {
    ListView()
        .environmentObject(ListViewModel())
}

