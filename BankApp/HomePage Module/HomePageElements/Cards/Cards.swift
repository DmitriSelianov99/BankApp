//
// Cards.swift
// BankApp


import SwiftUI

struct Cards: View {
    
    @ObservedObject public var cardViewModel: CardViewModel
    
    @State var showSheet: Bool = false
    @State private var selectedCard: CardModel? = nil
    @State var selectedCardIndex: Int = 0

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 13.0) {
                ForEach(cardViewModel.cardsArray.indices, id: \.self) { index in
                    
                    VStack(alignment: .leading) {
                        Text(cardViewModel.cardsArray[index].cardName)
                            .font(.system(size: 17, weight: .semibold, design: .default))
                            .italic()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 2.0) {
                            Text(cardViewModel.cardsArray[index].moneyType)
                                .font(.system(size: 11, weight: .medium, design: .default))
                            Text("$ \(FormatedFunctions.shared.formattedNumber(cardViewModel.cardsArray[index].count))")
                                .font(.system(size: 17, weight: .bold, design: .default))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Spacer()
                        
                        Text("** \(String(cardViewModel.cardsArray[index].cardNumber))")
                            .font(.system(size: 11, weight: .medium, design: .default))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(width: UIScreen.main.bounds.width / 2.6)
                    .padding(.leading, 16)
                    .padding(.top, 24)
                    .padding(.bottom, 20)
                    .background(LinearGradient(colors: cardViewModel.cardsArray[index].colorSet, startPoint: .topTrailing, endPoint: .bottomLeading))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .onTapGesture {
                        selectedCard = cardViewModel.cardsArray[index]
                        selectedCardIndex = index
                        showSheet.toggle()
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        .frame(height: 170)
        .fullScreenCover(item: $selectedCard) { model in
            CardOperationsView(cardViewModel: cardViewModel, cardModel: model, cardIndex: $selectedCardIndex)
        }
    }
    
}

//#Preview {
//    Cards()
//}
