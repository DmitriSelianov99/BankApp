//
// Customizations.swift
// BankApp


import Foundation
import SwiftUI

//MARK: - УБИРАЕТ СПРАВА СТРЕЛКУ У LABEL
struct CustomDisclosureGroupStyle: DisclosureGroupStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            HStack {
                configuration.label
                Spacer()
            }
            if configuration.isExpanded {
                configuration.content
            }
        }
    }
}


class FormatedFunctions {
    static let shared = FormatedFunctions()
    
    private init(){}
    
    func formattedNumber(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }
}
