//
// Exchange.swift
// BankApp


import Foundation

struct ExchangeRates: Codable {
    let rates: [String: Double]
    let base: String
//    let date: String
}

class ExchangeRateService: ObservableObject {
    
    @Published var exchangeRates: ExchangeRates?


    func fetchExchangeRates() {
//        let urlString = "https://openexchangerates.org/api/latest.json?app_id=\(apiKey)"
        let urlString = ""
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print("Error fetching exchange rates: \(error)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let exchangeRates = try JSONDecoder().decode(ExchangeRates.self, from: data)
                DispatchQueue.main.async {
                    self?.exchangeRates = exchangeRates
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}

