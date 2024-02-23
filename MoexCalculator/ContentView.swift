//
//  ContentView.swift
//  MoexCalculator
//
//  Created by Konstantin Kirillov on 18.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var color = Color.green
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                
            Text("Hello, практикум!")
                .padding()
                .foregroundStyle(color)
            Button("Press the button") {
                cangeColor()
            }
        }
    }
    
    func cangeColor() {
        if color == .green {
            color = .orange
        } else {
            color = .green
        }
    }
}

#Preview {
    ContentView()
}
