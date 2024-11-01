//
// ContentView.swift
// BankApp


import SwiftUI

struct HomeView: View {
    @ObservedObject var cardViewModel: CardViewModel
    
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.black.opacity(0.8), .black, .black, Color.black.opacity(0.8)], startPoint: .topTrailing, endPoint: .bottom).ignoresSafeArea()
            
            VStack {
                HomeHeaderView()
                    .padding(.horizontal, 16)
                    .padding(.bottom, 20)
                
                ScrollView {
                    HomeBalanceView()
                        .padding(.top, 20)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 24)
                    
                    Cards(cardViewModel: cardViewModel)
                        .padding(.leading, 20)
                        .padding(.bottom, 40)
                    
                    FinanceView()
                        .padding(.leading, 20)
                        .padding(.bottom, 36)
                    
                    FinancingOptionsView()
                        .frame(maxHeight: .infinity, alignment: .top)
                    
                    Spacer()
                }
                
            }
        }
    }
}

//#Preview {
//    HomeView()
//}
