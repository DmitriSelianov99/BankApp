//
// ChatBottomView.swift
// BankApp


import SwiftUI

struct ChatBottomView: View {
    
    @Binding var textfiledText: String
    @Binding var chat: ChatModel
    @Binding var isTransferOpen: Bool
    
    var body: some View {
        HStack {
            Button("$") {
                isTransferOpen.toggle()
            }
            .frame(width: 32, height: 32)
            .foregroundStyle(.black)
            .background(.linearYellow100)
            .clipShape(Circle())
            
            TextField(text: $textfiledText) {
                Text("Money or message")
                    .foregroundStyle(.white.opacity(0.5))
                    .font(.system(size: 12, weight: .regular))
            }
            .padding()
            .font(.system(size: 12, weight: .regular))
            .foregroundStyle(.white)
            .frame(height: 40)
            .background(
                RoundedRectangle(cornerRadius: 20)
            )
            
            Button(action: {
                
            }, label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundStyle(.linearYellow100)
            })
        }
        .padding(.horizontal, 20)
    }
}
