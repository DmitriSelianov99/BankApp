//
// MyBudgetOperationsListView.swift
// BankApp


import SwiftUI

struct MyBudgetOperationsListView: View {
    
    @ObservedObject var operationsVM = OperationsViewModel()
    
    var body: some View {
        ZStack {
            Color.specialGray.ignoresSafeArea()
            
            ScrollView {
                VStack {
                    Text("June 15, 2020")
                        .font(.system(size: 21, weight: .semibold))
                        .foregroundStyle(.white)
                    
                    VStack(alignment: .leading) {
                        ForEach(operationsVM.operations, id: \.self) { operation in
                            HStack {
                                Image(operation.imageName)
                                
                                VStack(alignment: .leading) {
                                    Text(operation.name)
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundStyle(.white)
                                    Text(operation.descr)
                                        .font(.system(size: 14, weight: .regular))
                                        .foregroundStyle(.white.opacity(0.3))
                                }
                                
                                Spacer()
                                
                                Text("-$\(operation.money)")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundStyle(.white)
                            }
                            .padding(.bottom, 20)
                        }
                    }
                    .padding(.horizontal, 24)
                    .frame(maxHeight: .infinity)
                }
                .padding(.top)
            }
            .frame(maxHeight: .infinity)
        }
    }
}

struct OperationsModel: Hashable {
    let name: String
    let descr: String
    let imageName: String
    let money: Int
}

class OperationsViewModel: ObservableObject {
    
    var operations: [OperationsModel] = []
    
    init() {
        getOperations()
    }
    
    func getOperations() {
        operations.append(OperationsModel(name: "Webflow", descr: "Outcoming transfer", imageName: "webflow", money: 45))
        operations.append(OperationsModel(name: "Sketch", descr: "Annual withdrawal of funds", imageName: "sketch", money: 79))
        operations.append(OperationsModel(name: "Youtube", descr: "Annual withdrawal of funds", imageName: "youtube", money: 15))
        operations.append(OperationsModel(name: "Unsplash", descr: "Outcoming transfer", imageName: "unsplash", money: 9))
        operations.append(OperationsModel(name: "Webflow", descr: "Outcoming transfer", imageName: "webflow", money: 45))
        operations.append(OperationsModel(name: "Sketch", descr: "Annual withdrawal of funds", imageName: "sketch", money: 79))
        operations.append(OperationsModel(name: "Youtube", descr: "Annual withdrawal of funds", imageName: "youtube", money: 15))
        operations.append(OperationsModel(name: "Unsplash", descr: "Outcoming transfer", imageName: "unsplash", money: 9))
    }
}





#Preview {
    MyBudgetOperationsListView()
}
