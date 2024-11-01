//
// CardOperationsTransactionView.swift
// BankApp


import SwiftUI

struct CardOperationsTransactionView: View {
    
    @Binding var filter: String
    @Binding var currentCard: CardModel
    @ObservedObject var transactions = TransactionViewModel()
    
    var body: some View {
        ZStack {
            Color.specialBlack.ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("Transactions")
                        .font(.system(size: 21, weight: .regular))
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Menu {
                        Button("Reset filter") {
                            filter = "Filter"
                        }
                        
                        Button("Output") {
                            filter = "Output"
                        }
                        
                        Button("Input") {
                            filter = "Input"
                        }
                        
                    } label: {
                        HStack {
                            Text(filter)
                                .font(.system(size: 14, weight: .regular))
                            Image(systemName: "chevron.down")
                        }
                        .foregroundStyle(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    }

                }
                
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Today")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundStyle(.white)
                            .padding(.bottom, 16)
                        
                        ForEach(transactions.transactionsArray.filter { $0.card.cardNumber == currentCard.cardNumber}) { transaction in
                            if (transaction.type.name == filter || filter == "Filter") {
                                HStack(alignment: .top) {
                                    Circle()
                                        .fill(transaction.type == .input ? Color.linearYellow100 : Color.linearGray100)
                                        .frame(width: 32, height: 32)
                                        .overlay {
                                            Image(systemName: transaction.type == .input ? "arrow.down.to.line" : "arrow.up.to.line")
                                        }
                                    
                                    VStack(alignment: .leading) {
                                        Text(transaction.description)
                                            .font(.system(size: 16, weight: .medium))
                                            .foregroundStyle(.white)
                                        Text(transaction.name)
                                            .font(.system(size: 14, weight: .regular))
                                            .foregroundStyle(.white.opacity(0.5))
                                    }
                                    .padding(.leading, 16)
                                    
                                    Spacer()
                                    
                                    Text("\(transaction.type == .input ? "+" : "-")$\(transaction.count)")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundStyle(.white)
                                }
                                .padding(.bottom)
                            }
                        }
                        
                        
                    }
                }
                .scrollIndicators(.hidden)
            }
            .padding(.horizontal, 24)
            .padding(.top, 32)
        }
        .clipShape(
            .rect(
                topLeadingRadius: 25,
                topTrailingRadius: 25
            )
        )
    }
}
