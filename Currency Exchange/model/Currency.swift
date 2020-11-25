//
//  Currency.swift
//  Currency Exchange
//
//  Created by Hossam on 11/24/20.
//

import SwiftUI

struct Currency: Identifiable {
    
   
    var id = UUID().uuidString
    
    var currencyName:String
    var currencyValue:Double
    
    
}

struct Converistion:Decodable {
    var rates:[String:Double]
    var date,base:String
}
