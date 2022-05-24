//
//  HeaderView.swift
//  AFL4
//
//  Created by SIFT - Telkom DBT Air 4 on 24/05/22.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Explore onsale games here")
                    .font(.system(size: 25)).bold()
            }
            Spacer()
            Image("anbu").resizable().frame(width: 50, height: 50)
                .cornerRadius(50)
        }
        .padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
