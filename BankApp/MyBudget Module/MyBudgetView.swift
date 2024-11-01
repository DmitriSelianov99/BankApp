//
// MyBudgetView.swift
// BankApp


import SwiftUI
import Charts
import LineChartView

//struct MyBudgetView: View {
//    @State private var showSheet: Bool = true
//    
//    var body: some View {
//        ZStack {
//            LinearGradient(colors: [Color.black.opacity(0.8), .black], startPoint: .topTrailing, endPoint: .bottomLeading).ignoresSafeArea()
//            
//            VStack {
//                MyBudgetHeaderView()
//                
//                MyBudgetTotalBudgetView()
//                
//                MyBudgetDiagramView()
//                
//                Spacer()
//            }
//        }
//        .sheet(isPresented: $showSheet, content: {
//            MyBudgetOperationsListView()
//                .presentationDetents([.fraction(0.35), .fraction(0.7)])
//                .presentationDragIndicator(.visible)
//                .interactiveDismissDisabled()
//        })
//    }
//}

struct MyBudgetView: View {
    @State private var showSheet: Bool = true
    @State private var sheetOffset: CGFloat = UIScreen.main.bounds.height * 0.65
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.black.opacity(0.8), .black], startPoint: .topTrailing, endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            VStack {
                MyBudgetHeaderView()
                
                MyBudgetTotalBudgetView()
                
                MyBudgetDiagramView()
                
                Spacer()
            }
            
            // Overlay для кастомного листа
            if showSheet {
                MyBudgetOperationsListView()
                    .frame(height: UIScreen.main.bounds.height * 0.45)
                    .background(.thinMaterial) // Фон для выделения
                    .cornerRadius(20)
                    .offset(y: sheetOffset) // Управляем позицией
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                // Обновляем позицию листа в процессе перетаскивания
                                if value.translation.height > 0 {
                                    sheetOffset = UIScreen.main.bounds.height * 0.35 + value.translation.height
                                }
                            }
                            .onEnded { value in
                                // Определяем, оставить ли лист открытым или закрыть
                                if value.translation.height > 100 {
                                    // Если потянули вниз, закрываем лист
                                    showSheet = false
                                } else {
                                    // Возвращаем лист на место
                                    sheetOffset = UIScreen.main.bounds.height * 0.35
                                }
                            }
                    )
                    .animation(.easeInOut, value: sheetOffset)
            }
        }
        .onAppear {
            // Начальная позиция листа, когда он показан
            sheetOffset = UIScreen.main.bounds.height * 0.35
        }
    }
}


#Preview {
    MyBudgetView()
}

