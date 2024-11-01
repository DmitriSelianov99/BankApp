//
// ChatView.swift
// BankApp


import SwiftUI

struct ChatView: View {
    
    @State var chat: ChatModel
    @State var textfiledText: String = ""
    @State var isTransferOpen: Bool = false
    
    var chats: ChatsViewModel
    
    @ObservedObject var cards: CardViewModel
    
    var body: some View {
        ZStack {
            
            LinearGradient(colors: [Color.black.opacity(0.8), .black, .black, Color.black.opacity(0.8)], startPoint: .topTrailing, endPoint: .bottom).ignoresSafeArea()
            
            VStack {
                ChatHeaderView(chat: chat)
                ChatMessagesView(chat: chat)
                ChatBottomView(textfiledText: $textfiledText, chat: $chat, isTransferOpen: $isTransferOpen)
            }
            .fullScreenCover(isPresented: $isTransferOpen, content: {
                ChatTransferView(chat: chat, cards: cards, chats: chats)
            })
        }
    }
}






//#Preview {
//    ChatView(chat: ChatModel(members: [ChatMember(name: "You", type: .you, photo: ""), ChatMember(name: "Jeniffer", type: .person, photo: "jeniffer")], messages: [
//        Message(money: "15", owner: ChatMember(name: "You", type: .you, photo: ""), comment: nil),
//        Message(money: "215", owner: ChatMember(name: "Jeniffer", type: .person, photo: "jeniffer"), comment: nil),
//        Message(money: "26", owner: ChatMember(name: "You", type: .you, photo: ""), comment: nil),
//        Message(money: "310", owner: ChatMember(name: "You", type: .you, photo: ""), comment: "I return the debt"),
//        Message(money: "50", owner: ChatMember(name: "Jeniffer", type: .person, photo: "jeniffer"), comment: "Hi! I return the debt"),
//    ])
//    )
//}
