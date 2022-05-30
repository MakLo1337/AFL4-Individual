//
//  MoreMenu.swift
//  AFL4
//
//  Created by SIFT - Telkom DBT Air 4 on 30/05/22.
//

import SwiftUI

struct MoreMenu: View {
    @EnvironmentObject var index: GameIndex
    var storeid:Int
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MoreMenu_Previews: PreviewProvider {
    static var previews: some View {
        MoreMenu(storeid: Int())
    }
}
