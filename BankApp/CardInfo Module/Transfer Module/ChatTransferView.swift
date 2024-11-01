//
// ChatTransferView.swift
// BankApp


import SwiftUI

struct ChatTransferView: View {
    
    @ObservedObject var chat: ChatModel
    var chats: ChatsViewModel
    
    @State var money: String = "0"
    @State private var currentCard: CardModel? = nil
    @State var isMoneySended: Bool = false
    
    @ObservedObject var cards: CardViewModel
    
    init(chat: ChatModel, cards: CardViewModel, chats: ChatsViewModel) {
        self.cards = cards
        self.chat = chat
        self.chats = chats
        // Устанавливаем значение currentCard только если cardsArray не пустой
        if let firstCard = cards.cardsArray.first {
            self._currentCard = State(initialValue: firstCard) // Инициализация currentCard
        }

    }
    
    var body: some View {
        ZStack {
            
            LinearGradient(colors: [Color.black.opacity(0.8), .black, .black, Color.black.opacity(0.8)], startPoint: .topTrailing, endPoint: .bottom).ignoresSafeArea()
            
            VStack {
                ChatTransferHeaderView()
                ChatTransferBodyView(chat: chat, chats: chats, money: $money, currentCard: $currentCard, isMoneySended: $isMoneySended, cards: cards)
            }
        }
        .onChange(of: isMoneySended) { _ in
            if let firstCard = cards.cardsArray.first {
                currentCard = firstCard // Инициализация currentCard
            }
        }
    }
}

struct ChatTransferBodyView: View {
    
    let chat: ChatModel
    var chats: ChatsViewModel
    
    @Binding var money: String
    @Binding var currentCard: CardModel?
    @Binding var isMoneySended: Bool
    
    @ObservedObject var cards: CardViewModel
    
    var body: some View {
        ZStack {
            
            Color.specialGray.ignoresSafeArea()
            
            VStack(alignment: .center) {
                ChatTransferAddresseeMoneyView(chat: chat)
                ChatTransferMoneyFieldView(money: $money)
                ChatTransferCardView(cards: cards, currentCard: $currentCard)
                ChatTransferNumpadView(money: $money, currentCard: $currentCard, cards: cards, isMoneySended: $isMoneySended, chats: chats, chat: chat)
                
                Spacer()
            }
        }
        .clipShape(
            .rect(
                topLeadingRadius: 20,
                topTrailingRadius: 20
            )
        )
        .ignoresSafeArea()
    }
}

struct ChatTransferCardView: View {
    
    @ObservedObject var cards: CardViewModel
    @Binding var currentCard: CardModel?
    
    @State var showActionSheet: Bool = false
    
//    init(cards: CardViewModel) {
//        self.cards = cards
//        // Устанавливаем значение currentCard только если cardsArray не пустой
//        if let firstCard = cards.cardsArray.first {
//            self._currentCard = State(initialValue: firstCard) // Инициализация currentCard
//        }
//
//    }
    
    var body: some View {
        
        HStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 20)
                .overlay {
                    Text("\(currentCard?.cardName ?? "0000")")
                        .foregroundStyle(.linearGray100)
                        .italic()
                }
                .frame(width: 52, height: 52
                )
            
            VStack(alignment: .leading) {
                Text("\(currentCard?.cardName ?? "0000")")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(.white)
                Text("$\(FormatedFunctions.shared.formattedNumber(currentCard!.count))")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(.white.opacity(0.5))
            }
            
            Spacer()
            
            Text("••\(String(currentCard?.cardNumber ?? 0000))")
                .padding(.horizontal, 4)
                .padding(.vertical, 7)
                .background(.transferButton)
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            
        }
        .frame(height: 52)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 24)
        .padding(.bottom, 24)
        .padding(.top, 32)
        .onTapGesture {
            showActionSheet.toggle()
        }
        .confirmationDialog("Changing card", isPresented: $showActionSheet) {
            ForEach(cards.cardsArray) { card in
                Button(action: {
                    currentCard = card
                }, label: {
                    Text("\(card.cardName) ••\(card.cardNumber)")
                })
            }
        }
    }
}

//#Preview {
//    ChatTransferView(chat: ChatModel(members: [ChatMember(name: "You", type: .you, photo: ""), ChatMember(name: "Jeniffer", type: .person, photo: "jeniffer")], messages: [
//        Message(money: "15", owner: ChatMember(name: "You", type: .you, photo: ""), comment: nil),
//        Message(money: "215", owner: ChatMember(name: "Jeniffer", type: .person, photo: "jeniffer"), comment: nil),
//        Message(money: "26", owner: ChatMember(name: "You", type: .you, photo: ""), comment: nil),
//        Message(money: "310", owner: ChatMember(name: "You", type: .you, photo: ""), comment: "I return the debt"),
//        Message(money: "50", owner: ChatMember(name: "Jeniffer", type: .person, photo: "jeniffer"), comment: "Hi! I return the debt"),
//    ]))
//}

struct ChatTransferAddresseeMoneyView: View {
    
    let chat: ChatModel
    
    var body: some View {
        VStack {
            Image("\(chat.members[1].photo)")
            Text("\(chat.members[1].name)")
                .font(.system(size: 14, weight: .regular))
                .foregroundStyle(.white)
        }
        .padding(.top, 24)
        .padding(.bottom, 31)
    }
}

struct ChatTransferMoneyFieldView: View {
    
    @Binding var money: String
    
    var body: some View {
        HStack {
            Text("$")
                .font(.system(size: 32, weight: .medium))
                .foregroundStyle(.white)
            Text("\(money)")
                .font(.system(size: 32, weight: .medium))
                .foregroundStyle(money == "0" ? .white.opacity(0.5) : .white)
            
        }
    }
}
