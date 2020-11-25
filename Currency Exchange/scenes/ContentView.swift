//
//  ContentView.swift
//  Currency Exchange
//
//  Created by Hossam on 11/24/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      
        NavigationView {
            
            HomeView()
                .navigationTitle("Exchange Currency")
                .preferredColorScheme(.dark)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
