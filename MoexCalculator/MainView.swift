//
//  ContentView.swift
//  MoexCalculator
//
//  Created by Konstantin Kirillov on 18.02.2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: CalculatorViewModel
    
    var body: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
        case .error:
            VStack {
                Text("🤷🏻‍♂️")
                    .font(.system(size: 100))
                    .padding()
                Text("Что-то пошло не так. \n Пожалуйста, попробуйте позже.")
                    .font(.body)
            }
            .multilineTextAlignment(.center)
        case .content:
            CalculatorView()
        }
    }
}

#Preview {
    MainView()
}

