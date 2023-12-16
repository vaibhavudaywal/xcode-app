//
//  ListRowView.swift
//  onething
//
//  Created by Vaibhav Udaywal on 16/12/23.
//

import Foundation
import SwiftUI

struct ListRowView: View {

    var title: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        }
    }
}

//#Preview {
//    ListRowView(title: "This is the first title")
//}
