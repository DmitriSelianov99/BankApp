//
// FinanceView.swift
// BankApp


import SwiftUI

struct FinanceView: View {
    private var financeIcons: [String] = ["star", "creditcard", "chart.bar.xaxis"]
    private var financeIconsColors: [Color] = [.linearYellow100, .linearGray100, .linearPurple100]
    private var financeTitles: [String] = ["My bonuses", "My budget", "Finance analysis"]
    
    @State var isBudgetViewOpen: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12.0) {
            Text("FINANCE")
                .font(.system(size: 10))
                .foregroundStyle(.white)
            
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
                                .font(.system(size: 11, weight: .medium, design: .default))
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
                        .onTapGesture {
                            if x == 1 {
                                isBudgetViewOpen.toggle()
                            }
                        }
                        
                    }
                }
            }
            .fullScreenCover(isPresented: $isBudgetViewOpen, content: {
                MyBudgetView()
            })
        }
    }
}

#Preview {
    FinanceView()
}
