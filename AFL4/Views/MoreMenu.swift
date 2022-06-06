//
//  MoreMenu.swift
//  AFL4
//
//  Created by SIFT - Telkom DBT Air 4 on 30/05/22.
//

import SwiftUI

struct ImageURLMore:View{
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

struct MoreMenu: View {
    var storeid:Int
    @EnvironmentObject var userwish:UserWish
    @StateObject var SteamAllVM = ViewModelSteamAll()
    @StateObject var EpicAllVM = ViewModelEpicAll()
    @StateObject var OriginAllVM = ViewModelOriginAll()
    @StateObject var GGAllVM = ViewModelGamersGateAll()
    @StateObject var GPAllVM = ViewModelGamersplanetAll()
    
    
    private let gridlayout = [GridItem(.adaptive(minimum: 170))]
    var moregames:[Game] = []
    
    var body: some View {
        VStack{
            ScrollView{
                if(storeid == 1){
                    LazyVGrid(columns: gridlayout, spacing: 20){
                        ForEach(SteamAllVM.games, id:\.self){
                            game in
                            VStack {
                                VStack{
                                    ZStack(alignment:.bottomLeading){
                                        VStack{
                                            ImageURLMore(urlImg: game.thumb)
                                            Rectangle().fill(Color.red).frame(width: 180, height: 50, alignment: .bottomLeading).overlay(Text(game.savings.prefix(2) + "% OFF").foregroundColor(.white).bold())
                                            Text(game.title)
                                                .bold()
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
                                            .buttonStyle(.bordered)
                                            .padding(.bottom, 10)
                                            .cornerRadius(10)
                                        }
                                        
                                        .frame(width: 180, height: 220).background(.white)
                                        
                                    }
                                    .cornerRadius(10)
        
                                }.shadow(color: Color.gray, radius: 4)
                            }
                            .padding([.leading, .bottom, .trailing])
                        }
                    }
                    .onAppear{
                        SteamAllVM.fetch()
                    }
                } else if (storeid == 2) {
                    LazyVGrid(columns: gridlayout, spacing: 20){
                        ForEach(EpicAllVM.games, id:\.self){
                            game in
                            VStack {
                                VStack{
                                    ZStack(alignment:.bottomLeading){
                                        VStack{
                                            ImageURLMore(urlImg: game.thumb)
                                            Rectangle().fill(Color.red).frame(width: 180, height: 50, alignment: .bottomLeading).overlay(Text(game.savings.prefix(2) + "% OFF").foregroundColor(.white).bold())
                                            Text(game.title)
                                                .bold()
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
                                            .buttonStyle(.bordered)
                                            .padding(.bottom, 10)
                                            .cornerRadius(10)
                                        }
                                        
                                        .frame(width: 180, height: 220).background(.white)
                                        
                                    }
                                    .cornerRadius(10)
        
                                }.shadow(color: Color.gray, radius: 4)
                            }
                            .padding([.leading, .bottom, .trailing])
                        }
                    }
                    .onAppear{
                        EpicAllVM.fetch()
                    }
                } else if (storeid == 3) {
                    LazyVGrid(columns: gridlayout, spacing: 20){
                        ForEach(OriginAllVM.games, id:\.self){
                            game in
                            VStack {
                                VStack{
                                    ZStack(alignment:.bottomLeading){
                                        VStack{
                                            ImageURLMore(urlImg: game.thumb)
                                            Rectangle().fill(Color.red).frame(width: 180, height: 50, alignment: .bottomLeading).overlay(Text(game.savings.prefix(2) + "% OFF").foregroundColor(.white).bold())
                                            Text(game.title)
                                                .bold()
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
                                            .buttonStyle(.bordered)
                                            .padding(.bottom, 10)
                                            .cornerRadius(10)
                                        }
                                        
                                        .frame(width: 180, height: 220).background(.white)
                                        
                                    }
                                    .cornerRadius(10)
        
                                }.shadow(color: Color.gray, radius: 4)
                            }
                            .padding([.leading, .bottom, .trailing])
                        }
                    }
                    .onAppear{
                        OriginAllVM.fetch()
                    }
                } else if (storeid == 4) {
                    LazyVGrid(columns: gridlayout, spacing: 20){
                        ForEach(GGAllVM.games, id:\.self){
                            game in
                            VStack {
                                VStack{
                                    ZStack(alignment:.bottomLeading){
                                        VStack{
                                            ImageURLMore(urlImg: game.thumb)
                                            Rectangle().fill(Color.red).frame(width: 180, height: 50, alignment: .bottomLeading).overlay(Text(game.savings.prefix(2) + "% OFF").foregroundColor(.white).bold())
                                            Text(game.title)
                                                .bold()
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
                                            .buttonStyle(.bordered)
                                            .padding(.bottom, 10)
                                            .cornerRadius(10)
                                        }
                                        
                                        .frame(width: 180, height: 220).background(.white)
                                        
                                    }
                                    .cornerRadius(10)
        
                                }.shadow(color: Color.gray, radius: 4)
                            }
                            .padding([.leading, .bottom, .trailing])
                        }
                    }
                    .onAppear{
                        GGAllVM.fetch()
                    }
                } else if (storeid == 5) {
                    LazyVGrid(columns: gridlayout, spacing: 20){
                        ForEach(GPAllVM.games, id:\.self){
                            game in
                            VStack {
                                VStack{
                                    ZStack(alignment:.bottomLeading){
                                        VStack{
                                            ImageURLMore(urlImg: game.thumb)
                                            Rectangle().fill(Color.red).frame(width: 180, height: 50, alignment: .bottomLeading).overlay(Text(game.savings.prefix(2) + "% OFF").foregroundColor(.white).bold())
                                            Text(game.title)
                                                .bold()
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
                                            .buttonStyle(.bordered)
                                            .padding(.bottom, 10)
                                            .cornerRadius(10)
                                        }
                                        
                                        .frame(width: 180, height: 220).background(.white)
                                        
                                    }
                                    .cornerRadius(10)
        
                                }.shadow(color: Color.gray, radius: 4)
                            }
                            .padding([.leading, .bottom, .trailing])
                        }
                    }
                    .onAppear{
                        GPAllVM.fetch()
                    }
                }
                
            }
        }
    }
}

struct MoreMenu_Previews: PreviewProvider {
    static var previews: some View {
        MoreMenu(storeid: Int()).environmentObject(UserWish())
    }
}
