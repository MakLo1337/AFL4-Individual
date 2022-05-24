//
//  ContentView.swift
//  AFL4
//
//  Created by SIFT - Telkom DBT Air 4 on 24/05/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("👋 Anbu")
                    .padding()
                HeaderView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
