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
    var body: some Scene {
        WindowGroup {
            ListView()
        }
    }
}
