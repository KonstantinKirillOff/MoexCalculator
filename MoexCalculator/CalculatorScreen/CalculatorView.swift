//
//  CalculatorView.swift
//  MoexCalculator
//
//  Created by Konstantin Kirillov on 24.02.2024.
//

import SwiftUI

struct CalculatorView: View {
    @ObservedObject var viewModel: CalculatorViewModel
    
    var numberFormatter: NumberFormatter = {
       let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.usesGroupingSeparator = false
        nf.maximumFractionDigits = 2
        return nf
    }()
    
    var body: some View {
        
        List {
            HStack {
                VStack {
                    Text(viewModel.topCurrency.flag)
                        .font(.system(size: 200))
                        .minimumScaleFactor(0.01)
                        .aspectRatio(1, contentMode: .fit)
                    Text(viewModel.topCurrency.rawValue)
                        .font(.title2)
                }
                .frame(height: 100)
                
                TextField("", value: $viewModel.topAmount, formatter: numberFormatter)
                    .font(.largeTitle)
                    .multilineTextAlignment(.trailing)
                    .minimumScaleFactor(0.5)
                    .keyboardType(.numberPad)
            }
            
            HStack {
                VStack {
                    Text(viewModel.bottomCurrency.flag)
                        .font(.system(size: 200))
                        .minimumScaleFactor(0.01)
                        .aspectRatio(1, contentMode: .fit)
                    Text(viewModel.bottomCurrency.rawValue)
                        .font(.title2)
                }
                .frame(height: 100)
                
                TextField("", value: $viewModel.bottomAmount, formatter: numberFormatter)
                    .font(.largeTitle)
                    .multilineTextAlignment(.trailing)
                    .minimumScaleFactor(0.5)
                    .keyboardType(.numberPad)
            }
        }
        
        
        
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView(viewModel: CalculatorViewModel())
    }
}
