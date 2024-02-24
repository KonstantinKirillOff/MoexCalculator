//
//  CurrencyInput.swift
//  MoexCalculator
//
//  Created by Konstantin Kirillov on 24.02.2024.
//

import SwiftUI

struct CurrencyInput: View {
    @Binding var isPickerPresented: Bool
    
    var currency: Currency
    var amount: Double
    var calculator: (Double) -> Void
    
    var numberFormatter: NumberFormatter = {
       let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.usesGroupingSeparator = false
        nf.maximumFractionDigits = 2
        return nf
    }()
    
    var body: some View {
        HStack {
            VStack {
                Text(currency.flag)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
                Text(currency.rawValue)
                    .font(.title2)
            }
            .frame(height: 100)
            .onTapGesture {
                isPickerPresented.toggle()
            }
            
            let topBinding = Binding<Double>(
                get: {
                    amount
                },
                
                set: {
                    calculator($0)
                }
            )
            
            TextField("", value: topBinding, formatter: numberFormatter)
                .font(.largeTitle)
                .multilineTextAlignment(.trailing)
                .minimumScaleFactor(0.5)
                .keyboardType(.numberPad)
        }
    }
}

#Preview {
    CurrencyInput(
        isPickerPresented: .constant(true), 
        currency: .RUR,
        amount: 1000) { _ in }
}
