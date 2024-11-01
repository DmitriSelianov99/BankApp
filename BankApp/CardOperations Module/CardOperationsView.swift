//
// CardOperationsView.swift
// BankApp


import SwiftUI

struct CardOperationsView: View {
    
    @ObservedObject public var cardViewModel: CardViewModel
    
    @State var cardModel: CardModel
    @State var filter: String = "Filter"
    @Binding var cardIndex: Int
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.black.opacity(0.8), .black], startPoint: .topTrailing, endPoint: .bottomLeading).ignoresSafeArea()
            
            VStack {
                CardOperationsHeaderView()
//                CardTemplate(cardModel: cardModel)
                CardOperationsCardsTabView(cardViewModel: cardViewModel, selectedTab: $cardIndex, currentCard: $cardModel, filter: $filter)
                
                CardOperationsTransactionView(filter: $filter, currentCard: $cardModel)
            }
        }
    }
}

//#Preview {
//    CardOperationsView(cardModel: CardModel(cardName: "Test", moneyType: "test", count: 0, cardNumber: 1234, colorSet: [Color("linearYellow100"), .green]), cardIndex: .constant(0))
//}


struct CardOperationsCardsTabView: View {

    @ObservedObject public var cardViewModel: CardViewModel
    @Binding var selectedTab: Int
    @Binding var currentCard: CardModel
    @Binding var filter: String
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(cardViewModel.cardsArray.indices, id: \.self) { index in
                CardTemplateView(cardModel: cardViewModel.cardsArray[index])
                    .tag(index)
            }
        }
        .frame(height: 270)
        .tabViewStyle(.page)
        .onChange(of: selectedTab) { newValue in
            currentCard = cardViewModel.cardsArray[newValue]
            filter = "Filter"
        }
        .onAppear {
            // Изменение цвета индикаторов страниц
            UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.linearYellow100 // Активная точка (выбранная страница)
            UIPageControl.appearance().pageIndicatorTintColor = UIColor.gray.withAlphaComponent(0.5) // Неактивные точки
        }
    }
}


