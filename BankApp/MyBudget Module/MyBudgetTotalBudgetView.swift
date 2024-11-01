//
// MyBudgetTotalBudgetView.swift
// BankApp


import SwiftUI

struct MyBudgetTotalBudgetView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4.0) {
                Text("$1,345")
                    .font(.system(size: 21, weight: .semibold))
                Text("September forecast $2,010")
                    .font(.system(size: 12, weight: .regular))
            }
            .padding(.top, 20)
            .padding(.leading, 24)
            .padding(.bottom, 20)
            
            Spacer()
            
            Text("June, 2024")
                .font(.system(size: 12, weight: .regular))
                .padding(.trailing, 24)
        }
        .foregroundStyle(.white)
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal, 20)
        .padding(.top, 36)
    }
}

#Preview {
    MyBudgetTotalBudgetView()
}
