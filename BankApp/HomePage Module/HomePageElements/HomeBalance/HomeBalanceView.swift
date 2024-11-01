//
// HomeBalanceView.swift
// BankApp


import SwiftUI

struct HomeBalanceView: View {
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text("Your balance")
                    .font(.system(size: 15, weight: .regular, design: .default))
                Text("$ 7,896")
                    .font(.system(size: 25, weight: .bold, design: .default))
            }
            .foregroundStyle(.white)
            
            Spacer()
            
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.white)
                .frame(width: 32, height: 32)
                .background(.roundGray)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}

#Preview {
    HomeBalanceView()
}
