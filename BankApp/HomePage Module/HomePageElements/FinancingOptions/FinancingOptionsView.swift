//
// FinancingOptionsView.swift
// BankApp


import SwiftUI

struct FinancingOptionsView: View {
    
    //@Binding var currentLoansIsExpanded: Bool
    
    var body: some View {
        ZStack {
            Color.specialBlack.ignoresSafeArea()
            LazyVStack {
                CurrentLoansView()
                
                CurrenciesAndMetalsView()
                
                Spacer()
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .clipShape(
            .rect(
                topLeadingRadius: 25,
                topTrailingRadius: 25
            )
        )
        
    }
}

#Preview {
    FinancingOptionsView()
}
