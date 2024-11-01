//
// ChatTransferHeaderView.swift
// BankApp


import SwiftUI

struct ChatTransferHeaderView: View {
    
    @Environment(\.dismiss) var dismiss
    
//    let chat: ChatModel
    
    var body: some View {
        HStack(alignment: .center) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .frame(width: 32, height: 32)
                    .background(.roundGray)
                    .clipShape(Circle())
                    .foregroundStyle(.white)
            }
            Spacer()
            
            Text("Transfer")
                .foregroundStyle(.white)
                .font(.system(size: 16))
                .fontWeight(.medium)
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                Image(systemName: "ellipsis")
                    .frame(width: 32, height: 32)
                    .background(.roundGray)
                    .clipShape(Circle())
                    .rotationEffect(.degrees(90))
                    .foregroundStyle(.white)
            }
            .hidden()

        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
    }
}
