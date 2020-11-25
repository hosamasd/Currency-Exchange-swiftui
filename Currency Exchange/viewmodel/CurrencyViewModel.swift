//
//  CurrencyViewModel.swift
//  Currency Exchange
//
//  Created by Hossam on 11/24/20.
//

import SwiftUI

class CurrencyViewModel: ObservableObject {
    
    @Published var currencies:[Currency] = []
    @Published var base = "USD"
    
    init() {
        fetchData()
    }
    
    func fetchData()  {
        let urlString = "https://api.exchangeratesapi.io/latest?base=\(base)"
        
        let seesion = URLSession(configuration: .default)
        
        seesion.dataTask(with: URL(string: urlString)!) { (data, _, err) in
            do {
            let conversion = try JSONDecoder().decode(Converistion.self, from: data!)
           
                DispatchQueue.main.async {
                    self.currencies = conversion.rates.compactMap({ (key,value) -> Currency? in
                        Currency(currencyName: key, currencyValue: value)
                    })
                }
                
            }  catch {
                    print(err?.localizedDescription)
                }
        }
        .resume()
        
    }
    
    func updateData(base:String)  {
        self.base=base
        currencies.removeAll()
        fetchData()
    }
}
