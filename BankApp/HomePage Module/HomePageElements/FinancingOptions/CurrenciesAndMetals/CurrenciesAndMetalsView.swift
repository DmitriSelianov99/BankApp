//
// CurrenciesAndMetalsView.swift
// BankApp


import SwiftUI

struct CurrenciesAndMetalsView: View {
    
    @State var CAMisExpanded: Bool = true
    
    @StateObject private var exchangeRateService = ExchangeRateService()

    
    var body: some View {
        DisclosureGroup(
            
            isExpanded: $CAMisExpanded,

            content: {
                
                if let rates = exchangeRateService.exchangeRates?.rates {
                    if let rubRate = rates["RUB"] {
                        CAMOptions(type: "Currencie", models: [
                            FinancingElementModel(name: "USD", buy: rubRate, sell: rubRate, image: "dollarsign"),
                            FinancingElementModel(name: "EUR", buy: rubRate, sell: rubRate, image: "eurosign")
                        ])
                        
                        CAMOptions(type: "Metals", models: [
                            FinancingElementModel(name: "Gold", buy: rubRate, sell: rubRate, image: "scalemass"),
                            FinancingElementModel(name: "Silver", buy: rubRate, sell: rubRate, image: "scalemass")
                        ])
                    } else {
                        Text("RUB not found")
                    }
                } else {
                    Text("ERROR")
                }

            },
            label: {
                HStack {
                    Image(systemName: "chevron.right")
                        .rotationEffect(!CAMisExpanded ? .zero : .degrees(90))
                    
                    Text("CURRENCIES AND METALS")
                        .onTapGesture {
                            withAnimation(.linear) {
                                CAMisExpanded.toggle()
                            }
                    }
                }
                .font(.system(size: 10))
                .foregroundStyle(.white)
            }
        )
        .onAppear {
            exchangeRateService.fetchExchangeRates()
        }
        .disclosureGroupStyle(CustomDisclosureGroupStyle())
        .padding(.top, 12)
        .padding(.horizontal, 20)
    }
}

#Preview {
    CurrenciesAndMetalsView()
}

struct CAMOptions: View {
    
    public let type: String
    
    @ObservedObject private var financingElementVM: FinancingElementViewModel
    
    init(type: String, models: [FinancingElementModel]) {
        self.type = type
        //self.models = models
        self.financingElementVM = FinancingElementViewModel(models: models)
    }
    
    
    var body: some View {
        HStack(spacing: 32.0) {
            VStack(alignment: .leading, spacing: 12.0) {
                Text(type)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(Color.white.opacity(0.5))
                
                ForEach(financingElementVM.elements) { x in
                    HStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.linearGray100)
                            .frame(width: 20, height: 20)
                            .overlay(alignment: .center) {
                                Image(systemName: x.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 10, height: 12)
                            }
                        
                        Text(x.name)
                            .font(.system(size: 15, weight: .regular))
                            .foregroundStyle(Color.white)
                    }
                }
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 12.0) {
                Text("Buy")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(Color.white.opacity(0.5))
                
                ForEach(financingElementVM.elements) { x in
                    HStack {
                        Text("₽ \(x.buy, specifier: "%.2f")")
                            .font(.system(size: 15, weight: .regular))
                            .foregroundStyle(Color.white)
                    }
                }
            }
            
            VStack(alignment: .trailing, spacing: 12.0) {
                Text("Sell")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(Color.white.opacity(0.5))
                
                ForEach(financingElementVM.elements) { x in
                    HStack {
                        Text("₽ \(x.sell, specifier: "%.2f")")
                            .font(.system(size: 15, weight: .regular))
                            .foregroundStyle(Color.white)
                    }
                }
            }
        }
        .padding(20)
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 26))
    }
}

struct FinancingElementModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let buy: Double
    let sell: Double
    let image: String
}

class FinancingElementViewModel: ObservableObject {
    @Published var elements: [FinancingElementModel] = []
    
    init(models: [FinancingElementModel]) {
        getElements(models: models)
    }
    
    private func getElements(models: [FinancingElementModel]) {
        elements += models
//        elements.append(FinancingElementModel(name: "USD", buy: 78.92, sell: 78.92, image: "dollarsign"))
//        elements.append(FinancingElementModel(name: "EUR", buy: 78.92, sell: 78.92, image: "eurosign"))
    }
}

