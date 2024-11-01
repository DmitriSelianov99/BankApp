//
// CardsMVM.swift
// BankApp


import Foundation
import SwiftUI


struct CardModel: Identifiable, Equatable {
    let id: String = UUID().uuidString
    var cardName: String = ""
    var moneyType: String = ""
    var count: Double = 0
    var cardNumber: Int = 0
    var colorSet: [Color] = [.black]
    
    init(cardName: String, moneyType: String, count: Double, cardNumber: Int, colorSet: [Color]) {
        self.cardName = cardName
        self.moneyType = moneyType
        self.count = count
        self.cardNumber = cardNumber
        self.colorSet = colorSet
    }
    
    init() {}
}

class CardViewModel: ObservableObject {
    @Published var cardsArray: [CardModel] = []
    
    init() {
       getCards()
    }
    
    func getCards() {
        cardsArray.append(CardModel(cardName: "VISA", moneyType: "Salary", count: 2230, cardNumber: 6917, colorSet: [.linearGray0, .linearGray100]))
        cardsArray.append(CardModel(cardName: "VISA", moneyType: "Savings account", count: 5566, cardNumber: 4552, colorSet: [.linearYellow0, .linearYellow100]))
        cardsArray.append(CardModel(cardName: "VISA", moneyType: "For gifts", count: 1567, cardNumber: 4379, colorSet: [.linearPurple0, .linearPurple100]))
        
    }
    
    func sendMoney(card: CardModel, money: Int) {
        // Находим индекс карты в массиве cardsArray
        if let index = cardsArray.firstIndex(where: { $0 == card }) {
            // Уменьшаем значение count для найденной карты
            cardsArray[index].count -= Double(money)
        }
    }
}

//class CardModelRealm: Object, ObjectKeyIdentifiable {
//    @Persisted(primaryKey: true) var id: ObjectId
//    @Persisted var cardName: String
//    @Persisted var moneyType: String
//    @Persisted var count: Double
//    @Persisted var cardNumber: Int
//    @Persisted var colorSet = RealmSwift.List<String>() //массив
//    
//    override class func primaryKey() -> String? {
//        "id"
//    }
//}


//MARK: - TRANSACTIONS
enum TransactionType {
    case input
    case output
    
    var name: String {
        switch self {
        case .input:
            return "Input"
        case .output:
            return "Output"
        }
    }
}

struct TransactionModel: Identifiable {
    let id: String = UUID().uuidString
    let card: CardModel
    let type: TransactionType
    let name: String
    let description: String
    let count: String
}

class TransactionViewModel: ObservableObject {
    @Published var transactionsArray: [TransactionModel] = []
    
    let cards = CardViewModel()
    
    init() {
        getTransactions()
    }
    
    func getTransactions() {
        for card in cards.cardsArray {
            transactionsArray.append(TransactionModel(card: card, type: .input, name: "Incoming transfer", description: "Transfer \(card.cardNumber)", count: "3,110"))
            transactionsArray.append(TransactionModel(card: card, type: .output, name: "Outcoming transfer", description: "Health \(card.cardNumber)", count: "4,120"))
            transactionsArray.append(TransactionModel(card: card, type: .input, name: "Incoming transfer", description: "Transfer \(card.cardNumber)", count: "5,110"))
        }
    }
}
