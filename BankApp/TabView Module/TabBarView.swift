//
// TabBarView.swift
// BankApp


import SwiftUI

struct TabBarView: View {
    
    @State var selectedTab: Int = 0
    @State var cards = CardViewModel()
    
    init() {
        UITabBar.appearance().backgroundColor = .black
        UITabBar.appearance().layer.cornerRadius = 20
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(cardViewModel: cards)
                .tabItem {
                    Image(systemName: "house")
                        .renderingMode(.template)
                }.tag(0)
            
            Text("BAG")
                .tabItem {
                    Image(systemName: "bag")
                        .renderingMode(.template)
                }.tag(1)
            
            Text("CARD")
                .tabItem {
                    Image(systemName: "creditcard")
                        .renderingMode(.template)
                }.tag(2)
            
            CardInfoView(cards: cards)
                .tabItem {
                    Image(systemName: "ellipsis.message")
                        .renderingMode(.template)
                }.tag(3)
            
            Text("CLOCK")
                .tabItem {
                    Image(systemName: "clock")
                        .renderingMode(.template)
                }
        }
        .tint(.linearYellow100)
        .onAppear {
            UITabBar.appearance().unselectedItemTintColor = .white
        }
    }
}

#Preview {
    TabBarView()
}
