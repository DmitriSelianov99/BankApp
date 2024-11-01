//
// CardTemplateView.swift
// BankApp


import SwiftUI

struct CardTemplateView: View {
    
    let cardModel: CardModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 26)
                .fill(LinearGradient(colors: [cardModel.colorSet[0], cardModel.colorSet[1]], startPoint: .topTrailing, endPoint: .bottomLeading))
                .frame(height: 184)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(cardModel.cardName)
                        .font(.system(size: 20, weight: .semibold, design: .default))
                        .italic()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("$ \(FormatedFunctions.shared.formattedNumber(cardModel.count))")
                        .font(.system(size: 20, weight: .bold))
                }
                
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Image("cardChip")
                        Text("•••• •••• •••• \(String(cardModel.cardNumber))")
                            .font(.system(size: 15, weight: .bold))
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 3.0) {
                        Text("VALID THRU")
                            .font(.system(size: 10))
                            .foregroundStyle(.gray)
                        
                        Text("12/22")
                            .font(.system(size: 15, weight: .bold))
                    }
                }
                .padding(.top, 30)
                
                
                Text("NAME NAMEOVICH")
                    .font(.system(size: 10))
                    .foregroundStyle(.gray)
                    .padding(.top, 20)
            }
            .padding(.horizontal, 30)
            .padding(.top, 20)
            .padding(.bottom, 20)
        }
        .padding(.horizontal, 32)
    }
}

//#Preview {
//    CardTemplateView()
//}

