//
// SpecialOfferView.swift
// BankApp


import SwiftUI

struct SpecialOfferView: View {
    var body: some View {
        HStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 32, height: 32)
                .overlay(alignment: .center) {
                    Image(systemName: "bolt.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.yellow)
                        .frame(width: 15, height: 15)
                }
            
            VStack(alignment: .leading) {
                Text("Start investing now!")
                    .font(.system(size: 15, weight: .semibold))
                Text("Protected savings and investment plans")
                    .font(.system(size: 12, weight: .regular))
            }
            
            Spacer()
            
            Image(systemName: "multiply")
                .resizable()
                .frame(width: 8, height: 8)
        }
        .padding(20)
        .background(LinearGradient(colors: [.linearGray0, .linearGray100], startPoint: .topTrailing, endPoint: .bottomLeading))
        .clipShape(RoundedRectangle(cornerRadius: 26))
    }
}

#Preview {
    SpecialOfferView()
}
