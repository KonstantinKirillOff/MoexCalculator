//
//  View+Extension.swift
//  MoexCalculator
//
//  Created by Konstantin Kirillov on 24.02.2024.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
