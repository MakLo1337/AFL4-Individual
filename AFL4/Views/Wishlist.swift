//
//  Wishlist.swift
//  AFL4
//
//  Created by SIFT - Telkom DBT Air 4 on 30/05/22.
//

import SwiftUI

struct ImageURLWish:View{
    let urlImg:String
    @State var data:Data?
    var body: some View{
        if let data = data, let uiimage = UIImage(data: data){
            Image(uiImage: uiimage).resizable().aspectRatio(contentMode: .fill).frame(width:101, height: 30)
                .background(.white)
        } else {
            Image(systemName: "cart").resizable().frame(width: 70, height: 30).aspectRatio(contentMode: .fit).background(.gray).onAppear{
                fetchdata()
            }
        }
    }
    private func fetchdata(){
        guard let url = URL(string: urlImg) else{
            return
        }
        let task = URLSession.shared.dataTask(with: url){
            data, _ , _ in
            self.data = data
        }
        task.resume()
    }
}

struct Wishlist: View {
    @EnvironmentObject var userwish:UserWish
    var body: some View {
        if userwish.wishdata.isEmpty{
            Text("You don't have any games on your wishlist")
        } else {
            NavigationView{
                    List{
                        ForEach(userwish.wishdata, id:\.self){
                            game in
                            HStack{
                                VStack{
                                    ImageURLWish(urlImg: game.thumb)
                                }
                                Text(game.title).bold()
                                Spacer()
                                VStack{
                                    Button(action:{
                                        if(userwish.wishdata.contains(game)){
                                            if let index = userwish.wishdata.firstIndex(of: game){
                                                userwish.wishdata.remove(at: index)
                                            }
                                        } else {
                                            userwish.addGames(game)
                                        }
                                    },
                                           label: {
                                        Text(userwish.wishdata.contains(game) ? "Remove" : "Add to wishlist")
                                            .foregroundColor(userwish.wishdata.contains(game) ? Color.white : Color.blue)
                                    })
                                    .background(userwish.wishdata.contains(game) ? Color.red : Color.white)
                                    .frame(height:40)
                                    .buttonStyle(.borderedProminent)
                                    .cornerRadius(10)
                                }
                            }.padding(3)
                        }
                    }.navigationTitle("Wishlist")
            }
        }
    }
}

struct Wishlist_Previews: PreviewProvider {
    static var previews: some View {
        Wishlist().environmentObject(UserWish())
    }
}
