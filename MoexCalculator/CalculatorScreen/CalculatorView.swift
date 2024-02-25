//
//  CalculatorView.swift
//  MoexCalculator
//
//  Created by Konstantin Kirillov on 24.02.2024.
//

import SwiftUI

struct CalculatorView: View {
    //@ObservedObject var viewModel: CalculatorViewModel
    @EnvironmentObject var viewModel: CalculatorViewModel
    @State var isPickerPresented = true
    
    var body: some View {
        
        List {
            CurrencyInput(
                isPickerPresented: $isPickerPresented,
                currency: viewModel.topCurrency,
                amount: viewModel.topAmount,
                calculator: viewModel.setTopAmount
            )
            
            CurrencyInput(
                isPickerPresented: $isPickerPresented,
                currency: viewModel.bottomCurrency,
                amount: viewModel.bottomAmount,
                calculator: viewModel.setBottomAmount
            )
        }
        .foregroundColor(.accentColor)
        .onTapGesture {
            hideKeyboard()
        }
        .sheet(isPresented: $isPickerPresented, content: {
            VStack(spacing: 16) {
                Spacer()
                
                RoundedRectangle(cornerRadius: 3)
                    .fill(.secondary)
                    .frame(width: 60, height: 6)
                
                HStack {
                    CurrencyPicker(currency: $viewModel.topCurrency, onChange: { _ in
                        didChangeTopCurrency()
                    })
                    CurrencyPicker(currency: $viewModel.bottomCurrency, onChange: { _ in
                        didChangeBottomCurrency()
                    })
                }
                
            }.presentationDetents([.fraction(0.3)])
        })
    }
    
    private func didChangeTopCurrency() {
        viewModel.updateTopAmount()
    }
    
    private func didChangeBottomCurrency() {
        viewModel.updateBottomAmount()
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}


