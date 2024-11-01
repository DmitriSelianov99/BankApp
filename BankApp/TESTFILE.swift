//
// TESTFILE.swift
// BankApp


import SwiftUI
import LineChartView
import Charts



struct TESTFILE: View {
    private let data: [LineChartData] = [
            LineChartData(42, label: "The answer"),
            LineChartData(25.8, label: "Any text here"),
            LineChartData(88.19, label: "2021-11-21"),
            LineChartData(15.0, label: "My number"),
            LineChartData(32, label: "My number"),
            LineChartData(12, label: "My number"),
            LineChartData(78, label: "My number"),
            LineChartData(21, label: "My number"),
        ]
        
        var body: some View {
            let chartParameters = LineChartParameters(
                data: data,
                lineColor: .specialDiagram
            )
            
            LineChartView(lineChartParameters: chartParameters)
                .frame(height: 300)
        }
}

#Preview {
    TESTFILE()
}

struct ChartDate: Identifiable {

    var id = UUID().uuidString
    var date: Date
    var temperature: Double
    var animater: Bool = false

}

extension Date {
    func updateHour(value: Int)->Date{
        let calender = Calendar.current
        return calender.date(bySettingHour: value, minute: 0, second: 0, of: self) ?? .now
    }
}

let simple_date = [
    ChartDate(date: Date().updateHour(value: 6),temperature: 1230 ),
    ChartDate(date: Date().updateHour(value: 7),temperature: 1500 ),
    ChartDate(date: Date().updateHour(value: 8),temperature: 1030 ),
    ChartDate(date: Date().updateHour(value: 9),temperature: 1000 ),
    ChartDate(date: Date().updateHour(value: 10),temperature: 1930 ),
    ChartDate(date: Date().updateHour(value: 11),temperature: 1430 ),
    ChartDate(date: Date().updateHour(value: 12),temperature: 2230 ),
    ChartDate(date: Date().updateHour(value: 13),temperature: 1330 ),
    ChartDate(date: Date().updateHour(value: 14),temperature: 1930 ),

]
