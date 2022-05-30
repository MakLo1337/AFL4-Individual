//
//  ContentView.swift
//  AFL4
//
//  Created by SIFT - Telkom DBT Air 4 on 24/05/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView{
            Menu().tabItem {
                Image(systemName: "filemenu.and.selection")
                Text("List Games")
            }
            Wishlist().tabItem{
                Image(systemName: "list.dash")
                Text("Wishlist")
            }
            Settings().tabItem{
                Image(systemName: "gear")
                Text("Settings")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
