//
//  GlassBackground.swift
//  onething
//
//  Created by Vaibhav Udaywal on 17/12/23.
//

import Foundation
import SwiftUI

struct GlassBackground: NSViewRepresentable {
    func makeNSView(context: Context) -> NSVisualEffectView {
        let visualEffectView = NSVisualEffectView()
        visualEffectView.blendingMode = .behindWindow
        visualEffectView.material = .underWindowBackground
        return visualEffectView
    }

    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {
        // Update view if needed
    }
}
