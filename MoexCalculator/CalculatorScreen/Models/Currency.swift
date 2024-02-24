//
//  Currency.swift
//  MoexCalculator
//
//  Created by Konstantin Kirillov on 23.02.2024.
//

import Foundation

enum Currency: String, CaseIterable, Identifiable {
    case RUR
    case CNY
    case EUR
    case USD
    
    var id: Self { self }
    
    var flag: String {
        switch self {
        case .RUR: return "🇷🇺"
        case .CNY: return "🇨🇳"
        case .EUR: return "🇪🇺"
        case .USD: return "🇺🇸"
        }
    }
}
