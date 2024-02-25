//
//  MoexCalculatorApp.swift
//  MoexCalculator
//
//  Created by Konstantin Kirillov on 18.02.2024.
//

import SwiftUI

@main
struct MoexCalculatorApp: App {
    @StateObject var viewModel = CalculatorViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewModel)
        }
    }
}
