//
// CardInfoViewq.swift
// BankApp


import SwiftUI

struct CardInfoView: View {
    
    @State var textfieldText: String = ""
    @State var isPresented: Bool = false
    
    @ObservedObject var cards: CardViewModel
    
    var body: some View {
        ZStack {
            
            LinearGradient(colors: [Color.black.opacity(0.8), .black], startPoint: .topTrailing, endPoint: .bottomLeading).ignoresSafeArea()
            
            VStack {
                CardInfoHeaderView(textfieldText: $textfieldText)
                
                CardInfoDialoguesView()
                
                CardInfoChapters(isPresented: $isPresented)
                
                CardInfoMessagesView(cards: cards)
            }
        }
    }
}

//#Preview {
//    CardInfoView()
//}


struct CardInfoMessagesView: View {
    
    var chats = ChatsViewModel()
    
    @State var selectedChat: ChatModel? = nil
    
    @ObservedObject var cards: CardViewModel
    
    var body: some View {
        ZStack {
            Color.roundGray.ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("Messages")
                    .font(.system(size: 21, weight: .semibold))
                    .foregroundStyle(.white)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(chats.chats) { chat in
                            HStack(alignment: .top) {
                                Image("\(chat.members[1].photo)")
                                
                                VStack(alignment: .leading, spacing: 3.0) {
                                    Text("\(chat.members[1].name)")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundStyle(.white)
                                    Text("\(chat.messages.last?.comment != nil ? chat.messages.last!.comment! : "Transfer")")
                                        .font(.system(size: 14, weight: .regular))
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                                .padding(.leading, 16)
                                
                                Spacer()
                                
                                HStack {
                                    Text("10 Feb")
                                        .font(.system(size: 12, weight: .regular))
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                            }
                            .onTapGesture {
                                selectedChat = chat
                            }
                            .fullScreenCover(item: $selectedChat) { chat in
                                ChatView(chat: chat, chats: chats, cards: cards)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 31)
        }
        .clipShape(
            .rect(
                topLeadingRadius: 25,
                topTrailingRadius: 25
            )
        )
    }
}










struct CardInfoChapters: View {
    var financeIcons: [String] = ["star", "creditcard", "chart.bar.xaxis"]
    var financeIconsColors: [Color] = [.linearYellow100, .linearGray100, .linearPurple100]
    var financeTitles: [String] = ["Transfer money", "Lou Bonuses", "Lou Assets"]
    
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12.0) {
            
            ScrollView(.horizontal) {
                HStack(spacing: 14.0) {
                    ForEach(0..<3) { x in
                        VStack(alignment: .leading, spacing: 18) {
                            Image(systemName: financeIcons[x])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .padding(9)
                                .background(financeIconsColors[x])
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text(financeTitles[x])
                                .font(.system(size: 10, weight: .medium, design: .default))
                                .foregroundStyle(.white)
                                .minimumScaleFactor(0.5)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 16)
                        .padding(.top, 16)
                        .padding(.bottom, 14)
                        .frame(width: 100, height: 100)
                        .background(.specialBlack)
                        .clipShape(RoundedRectangle(cornerRadius: 26))
                    }
                    .onTapGesture {
                        isPresented.toggle()
                    }
                    .fullScreenCover(isPresented: $isPresented, content: {
                        Text("TEST")
                    })
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 24)
    }
}


enum CardInfoDialoguesButtons: CaseIterable {
    case actions
    case channels
    case postcards
    
    var name: String {
        switch self {
        case .actions: return "Actions"
        case .channels: return "Channels"
        case .postcards: return "Postcards"
        }
    }
}



