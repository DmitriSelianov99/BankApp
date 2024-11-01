//
// MyBudgetDiagramView.swift
// BankApp


import SwiftUI
import Charts

struct MyBudgetDiagramView: View {
    
    var data: [Movie] = [
        .init(genre: "Apr", title: "Die Hard", ticketPrice: 12.99),
        .init(genre: "May", title: "The Godfather", ticketPrice: 10.99),
        .init(genre: "Jun", title: "Superbad", ticketPrice: 9.99),
        .init(genre: "Jul", title: "The Shining", ticketPrice: 8.99),
        .init(genre: "Aug", title: "Star Wars", ticketPrice: 11.99)
    ]
    

    var body: some View {

        let curColor = Color.specialDiagram
        let curGradient = LinearGradient(colors: [curColor.opacity(0.5),
                                         curColor.opacity(0.2),
                                         curColor.opacity(0.05)], startPoint: .top, endPoint: .bottom)
        
        
        VStack {
            Chart {
                ForEach(data) { movie in
                    LineMark(x: .value("Genre", movie.genre),
                             y: .value("Ticket Price", movie.ticketPrice)
                    )
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(curColor)
                    .lineStyle(StrokeStyle(lineWidth: 3))
                    
                    AreaMark(x: .value("Genre", movie.genre),
                             y: .value("Ticket Price", movie.ticketPrice)
                    )
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(curGradient)
                }
            }
//            .chartXAxis(.hidden)  // Убираем ось X
            .chartYAxis(.hidden)  // Убираем ось Y
            .frame(maxWidth: .infinity, maxHeight: 300)  // Растягиваем на всю ширину экрана
            .padding(.horizontal, -48)  // Убираем внешние отступы


        }
        .frame(maxWidth: .infinity)
        .frame(height: 245)
        .padding(.top, 54)
        
    }
}

struct Movie: Identifiable {
    var genre: String
    var title: String
    var ticketPrice: Double
    var id = UUID()
}


#Preview {
    MyBudgetDiagramView()
}
