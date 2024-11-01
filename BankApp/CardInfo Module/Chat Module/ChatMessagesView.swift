//
// ChatMessagesView.swift
// BankApp


import SwiftUI

struct ChatMessagesView: View {
    
    @ObservedObject var chat: ChatModel
    
    var body: some View {
        GeometryReader { reader in
            ScrollView {
                VStack {
                    ForEach(chat.messages) { message in
                        
                        HStack {
                            if (message.owner.type == .you) {
                                Spacer()
                            }
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    VStack(alignment: .leading, spacing: 5.0) {
                                        Text(message.owner.type == .you ? "Transation done" : "You have been transferred")
                                            .font(.system(size: 12, weight: .regular))
                                        Text("$\(message.money)")
                                            .font(.system(size: 21, weight: .semibold))
                                    }
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 16)
                                    
                                    Spacer()
                                }
                                
                                if let comm = message.comment {
                                    Rectangle()
                                        .fill(.gray.opacity(0.3))
                                        .frame(height: 1)
                                    
                                    Text("\(comm)")
                                        .font(.system(size: 15, weight: .regular))
                                        .padding(.bottom, 8)
                                        .padding(.horizontal, 16)
                                }
                            }
                            .frame(width: reader.size.width * 0.45)
                            .background(message.owner.type == .you ? .linearGray100 : .linearYellow100)
                            .clipShape(
                                .rect (
                                    topLeadingRadius: 25,
                                    bottomLeadingRadius: message.owner.type == .you ? 25 : 0,
                                    bottomTrailingRadius: message.owner.type == .you ? 0 : 25,
                                    topTrailingRadius: 25
                                )
                            )
                            
                            
                            if (message.owner.type != .you) {
                                Spacer()
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}
