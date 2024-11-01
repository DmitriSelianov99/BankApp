//
// ChatHeaderView.swift
// BankApp


import SwiftUI

struct ChatHeaderView: View {
    @Environment(\.dismiss) var dismiss
    
    let chat: ChatModel
    
    var body: some View {
        HStack(alignment: .top) {
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
            
            VStack {
                Image("\(chat.members[1].photo)")
                Text("\(chat.members[1].name)")
                    .foregroundStyle(.white)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
            }
//                .padding(.trailing, 32)
            
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

        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
    }
}


#Preview {
    ChatHeaderView(chat: ChatModel(members: [ChatMember(name: "You", type: .you, photo: ""), ChatMember(name: "Jeniffer", type: .person, photo: "jeniffer")], messages: [
        Message(money: "15", owner: ChatMember(name: "You", type: .you, photo: ""), comment: nil),
        Message(money: "215", owner: ChatMember(name: "Jeniffer", type: .person, photo: "jeniffer"), comment: nil),
        Message(money: "26", owner: ChatMember(name: "You", type: .you, photo: ""), comment: nil),
        Message(money: "310", owner: ChatMember(name: "You", type: .you, photo: ""), comment: "I return the debt"),
        Message(money: "50", owner: ChatMember(name: "Jeniffer", type: .person, photo: "jeniffer"), comment: "Hi! I return the debt"),
    ]))
}
