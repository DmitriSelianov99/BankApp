//
// LoansView.swift
// BankApp


import SwiftUI

struct LoansView: View {
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(.linearGray100)
                .frame(width: 32, height: 32)
                .overlay(alignment: .center) {
                    Image(systemName: "banknote")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
            
            LoansPattern(firstText: "Account № 3874825", secondText: "Expires 12/22/2023")
            Spacer()
            LoansPattern(firstText: "$ 78,92", secondText: "Rate 3.5%")
        
        }
        .padding(20)
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 26))
    }
}

#Preview {
    LoansView()
}

struct LoansPattern: View {
    
    public let firstText: String
    public let secondText: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(firstText)
                .font(.system(size: 15, weight: .regular))
                .foregroundStyle(.white)
            Text(secondText)
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(.white.opacity(0.5))
        }
    }
}
