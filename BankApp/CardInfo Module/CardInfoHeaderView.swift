//
// CardInfoHeaderView.swift
// BankApp


import SwiftUI

struct CardInfoHeaderView: View {
    
    @Binding var textfieldText: String
    
    var body: some View {
        HStack {
            Image(systemName: "person")
                .frame(width: 32, height: 32)
                .font(.title2)
                .background(.linearYellow100)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            
            Spacer(minLength: 16)
            
            TextField(text: $textfieldText) {
                Text("Name or number of phone")
                    .foregroundStyle(.white.opacity(0.5))
            }
            .padding([.top, .bottom], 5)
            .padding(.leading)
            .background(.black)
            .foregroundStyle(.white)
            .font(.system(size: 14, weight: .regular))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Spacer(minLength: 16)
            
            Image(systemName: "plus.message")
                .foregroundStyle(.white)
                .background(
                    Circle()
                        .fill(Color.roundGray)
                        .frame(width: 32, height: 32)
                )
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    CardInfoHeaderView(textfieldText: .constant("PREVIEW"))
}
