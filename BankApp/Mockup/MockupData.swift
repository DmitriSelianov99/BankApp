//
// MockupData.swift
// BankApp


import Foundation
import SwiftUI

enum UserType {
    case you
    case person
}

struct ChatMember: Equatable {
    let id = UUID()
    let name: String
    let type: UserType
    let photo: String
}

struct Message: Identifiable {
    let id: String = UUID().uuidString
    let money: String
    let owner: ChatMember
    let comment: String?
}

class ChatModel: ObservableObject ,Identifiable, Equatable {
    static func == (lhs: ChatModel, rhs: ChatModel) -> Bool {
        lhs.members[1] == rhs.members[1]
    }
    
    let id: String = UUID().uuidString
    let members: [ChatMember]
    @Published var messages: [Message]
    
    init(members: [ChatMember], messages: [Message]) {
            self.members = members
            self.messages = messages
    }
}

class ChatsViewModel: ObservableObject {
    @Published var chats: [ChatModel] = []
    
    var you = ChatMember(name: "You", type: .you, photo: "")
    var jeniffer = ChatMember(name: "Jeniffer", type: .person, photo: "jeniffer")
    var john = ChatMember(name: "John Baldwin", type: .person, photo: "john")
    
    init(){
        getChats()
    }
    
    func getChats() {
        chats.append(
            ChatModel(members: [you, jeniffer], messages: [
                Message(money: "15", owner: you, comment: nil),
                Message(money: "215", owner: jeniffer, comment: nil),
                Message(money: "26", owner: you, comment: nil),
                Message(money: "310", owner: you, comment: "I return the debt"),
                Message(money: "50", owner: jeniffer, comment: "Hi! I return the debt"),
            ])
        )
        
        chats.append(
            ChatModel(members: [you, john], messages: [
                Message(money: "15", owner: you, comment: nil),
                Message(money: "215", owner: john, comment: nil),
                Message(money: "26", owner: john, comment: nil),
                Message(money: "310", owner: john, comment: "I return the debt"),
                Message(money: "50", owner: john, comment: "Thanks"),
            ])
        )
    }
    
    func sendMessage(money: String, model: ChatModel) {
        
//        chats.first { $0 == model }?.messages.append(Message(money: "\(money)", owner: model.members[0], comment: nil))
        if let index = chats.firstIndex(where: { $0 == model }) {
                chats[index].messages.append(Message(money: money, owner: model.members[0], comment: nil))
            print(chats[index].messages)
        }
    }
    
}


class MyMoneyViewModel: ObservableObject {
    @Published var money: Int = 7896
    
    init() {}
    
    init(money: Int) {
        sendMoney(money)
    }
    
    func sendMoney(_ count: Int) {
        money -= count
    }
}
