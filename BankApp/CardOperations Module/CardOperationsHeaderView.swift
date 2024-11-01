//
// CardOperationsHeaderView.swift
// BankApp


import SwiftUI

struct CardOperationsHeaderView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .background(
                        Circle()
                            .fill(Color.roundGray)
                            .frame(width: 32, height: 32)
                    )
                    .foregroundStyle(.white)
            }
            Spacer()
            
            Text("Your cards")
                .foregroundStyle(.white)
                .font(.system(size: 16))
                .fontWeight(.medium)
                .padding(.trailing, 32)
            
            Spacer()

        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
    }
}

#Preview {
    CardOperationsHeaderView()
}
