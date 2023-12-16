//
//  onethingApp.swift
//  onething
//
//  Created by Vaibhav Udaywal on 07/12/23.
//

/*
 MVVM Architeture
 Model - data
 View - ui
 ViewModel - manages models for view
*/

import SwiftUI

@main
struct onethingApp: App {
    
    // If you want to observe this object, in case,
    // any value changes to the object, our views actually should update
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    // Also ObservableObject needs to be added to view model class
    
    var body: some Scene {
        WindowGroup {
            ListView()
        }
        .environmentObject(listViewModel)
        // So we can access this inside child view as @EnvironmentObject
    }
}
