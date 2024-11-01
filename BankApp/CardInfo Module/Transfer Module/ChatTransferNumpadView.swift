//
// ChatTransferNumpadView.swift
// BankApp


import SwiftUI

struct ChatTransferNumpadView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var money: String
    @Binding var currentCard: CardModel?
    @ObservedObject var cards: CardViewModel
    @Binding var isMoneySended: Bool
    
    var chats: ChatsViewModel
    @ObservedObject var chat: ChatModel
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 10, alignment: nil),
        GridItem(.flexible(), spacing: 10, alignment: nil),
        GridItem(.flexible(), spacing: 10, alignment: nil),
    ]
    
    var body: some View {
        VStack(spacing: 20.0) {
            Button("Send") {
                cards.sendMoney(card: currentCard ?? CardModel(), money: Int(money) ?? 0)
                chats.sendMessage(money: money, model: chat)
                money = "0"
                dismiss()
                isMoneySended.toggle()
            }
            .foregroundStyle(.black)
            .font(.system(size: 15, weight: .medium))
            .frame(height: 48)
            .frame(maxWidth: .infinity)
            .background(
                LinearGradient(colors: [.linearYellow0, .linearYellow100], startPoint: .top, endPoint: .bottom)
            )
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            
            LazyVGrid(columns: columns, spacing: 6, content: {
                ForEach(1..<10) { num in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.transferButton)
                        .frame(width: 100,height: 65)
                        .overlay {
                            Text("\(num)")
                                .font(.system(size: 32, weight: .regular))
                                .foregroundStyle(.white)
                        }
                        .onTapGesture {
                            if money == "0" {
                                money = ""
                            }
                            money += String(num)
                        }
                }
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 100,height: 65)
                    .hidden()
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(.transferButton)
                    .frame(width: 100,height: 65)
                    .overlay {
                        Text("0")
                            .font(.system(size: 32, weight: .regular))
                            .foregroundStyle(.white)
                    }
                    .onTapGesture {
                        if money != "0" {
                            money += "0"
                        }
                    }
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(.transferButton.opacity(0))
                    .frame(width: 100,height: 65)
                    .overlay {
                        Image(systemName: "delete.backward")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundStyle(.white)
                            .frame(width: 26)
                    }
                    .onTapGesture {
                        if money.count != 0 {
                            money.removeLast()
                        } else {
                            money = "0"
                        }
                    }
                
            })
            
            .onChange(of: money) { x in
                if x.count == 0 {
                    money = "0"
                }
            }
        }
        .padding(.horizontal, 24)
    }
}

//#Preview {
//    ChatTransferNumpadView(money: .constant("123"))
//}
