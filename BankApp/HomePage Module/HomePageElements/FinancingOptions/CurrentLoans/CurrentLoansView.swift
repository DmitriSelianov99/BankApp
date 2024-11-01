//
// CurrentLoansView.swift
// BankApp


import SwiftUI

struct CurrentLoansView: View {
    
    @State var currentLoansIsExpanded: Bool = false
    
    var body: some View {
        DisclosureGroup(
            isExpanded: $currentLoansIsExpanded,
            content: {
                LoansView()
                
                SpecialOfferView()
            },
            label: {
                HStack {
                    Image(systemName: "chevron.right")
                        .rotationEffect(!currentLoansIsExpanded ? .zero : .degrees(90))
                    Text("CURRENT LOANS")
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 8, height: 8)
                            .foregroundStyle(.white)
                    })
                    .frame(width: 20, height: 20)
                    .background(.roundGray)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                }
                .font(.system(size: 10))
                .foregroundStyle(.white)
                .onTapGesture {
                    withAnimation(.linear) {
                        currentLoansIsExpanded.toggle()
                    }
                }
            }
        )
        .disclosureGroupStyle(CustomDisclosureGroupStyle())
        .padding(.horizontal, 20)
        .padding(.top, 31)

    }
}

#Preview {
    CurrentLoansView()
}
