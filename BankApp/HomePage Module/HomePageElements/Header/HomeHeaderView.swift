//
// HomeHeaderView.swift
// BankApp


import SwiftUI

struct HomeHeaderView: View {
    var body: some View {
        HStack {
            Image(systemName: "person")
                .frame(width: 32, height: 32)
                .font(.title2)
                .background(.linearYellow100)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            
            
            Spacer()
            
            HStack(spacing: 0.0) {
                Text("Lou")
                    .foregroundStyle(.linearYellow100)
                    .font(.system(size: 18, weight: .bold, design: .default))
                Text("Bank")
                    .foregroundStyle(.white)
                    .font(.system(size: 18, weight: .light, design: .monospaced))
            }
            
            Spacer()
            
            Circle() //заглушка
                .frame(width: 32, height: 32)
                .hidden()
        }
    }
}

#Preview {
    HomeHeaderView()
}
