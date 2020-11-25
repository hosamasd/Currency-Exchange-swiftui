//
//  HomeView.swift
//  Currency Exchange
//
//  Created by Hossam on 11/24/20.
//

import SwiftUI

var currencies = ["USD","AUD","INR","JPY","EUR"]


struct HomeView: View {
    
    @StateObject var vm = CurrencyViewModel()
    
    var body: some View {
       
        VStack {
            
            if vm.currencies.isEmpty {
                ProgressView()
            }
            else {
                
                ScrollView {
                 
                    LazyVStack(alignment: .leading, spacing: 15, content: {
                        
                        ForEach(vm.currencies) {rate in
                            
                            HStack {
                                
                                Text(getFlagFromName(currency: rate.currencyName))
                                    .font(.system(size: 65))
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Text(rate.currencyName)
                                        .font(.title)
                                        .fontWeight(.bold)
                                    
                                    Text("\(rate.currencyValue)")
                                        .fontWeight(.heavy)
                                }
                                
                               
                            }
                            .padding(.horizontal)
                        }
                        
                    })
                    .padding(.top)
                   
                }
                
            }
            
        }
        .toolbar(content: {
            Menu(content:{
                
                ForEach(currencies,id: \.self) {name in
                    
                    Button(action: {
                        vm.updateData(base: name)
                    }, label: {
                        Text(name)
                    })
                    
                }
                
            }) {
                
                Text("Base = \(vm.base)")
                    .fontWeight(.heavy)
            }
        })
    }
    
    func getFlagFromName(currency:String) ->String {
        var base = 127397
        
        var code = currency
        code.removeLast()
        
        var scalar = String.UnicodeScalarView()
        
        for i in code.utf8 {
            scalar.append(UnicodeScalar(base + Int(i))!)
        }
        return String(scalar)
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
