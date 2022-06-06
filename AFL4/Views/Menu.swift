//
//  Menu.swift
//  AFL4
//
//  Created by SIFT - Telkom DBT Air 4 on 30/05/22.
//

import SwiftUI

struct ImageURL:View{
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

struct Menu: View {
    @EnvironmentObject var userwish:UserWish
    @StateObject var SteamSortedVM = ViewModelSteamSorted()
    @StateObject var EpicSortedVM = ViewModelEpicSorted()
    @StateObject var OriginSortedVM = ViewModelOriginSorted()
    @StateObject var GGSortedVM = ViewModelGamersGateSorted()
    @StateObject var GPSortedVM = ViewModelGamersplanetSorted()
    
    private let gridlayout = [GridItem(.adaptive(minimum: 170))]
    
    var body: some View {
        VStack {
            HStack{
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        Text("👋 Anbu")
                        HeaderView()
                    }
                    .padding()
                    Divider()
                    NavigationView{
                        ScrollView {
                            VStack(alignment: .leading){
                                HStack {
                                    Image("steam").resizable().frame(width: 30, height: 30)
                                    Text("Steam")
                                        .font(.system(size: 20)).bold()
                                    Spacer()
                                    NavigationLink(destination: MoreMenu(storeid: 1)){
                                        Text("More")
                                    }
                                }.padding(.all, 13.0)
                                LazyVGrid(columns: gridlayout, spacing: 20){
                                    ForEach(SteamSortedVM.games, id:\.self){
                                        game in
                                        VStack {
                                            VStack{
                                                ZStack(alignment:.bottomLeading){
                                                    VStack{
                                                        ImageURL(urlImg: game.thumb)
                                                        Rectangle().fill(Color.red).frame(width: 180, height: 50, alignment: .bottomLeading).overlay(Text(game.savings.prefix(2) + "% OFF").foregroundColor(.white).bold())
                                                        Text(game.title)
                                                            .bold().lineLimit(1).padding()
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
                                                    
                                                    .frame(width: 170, height: 220).background(.white)
                                                    
                                                }
                                                .cornerRadius(10)
                    
                                            }.shadow(color: Color.gray, radius: 4)
                                        }
                                        .padding([.leading, .bottom, .trailing])
                                    }
                                }
                                .onAppear{
                                    SteamSortedVM.fetch()
                                }
                                Spacer()
                            }
                            .navigationBarHidden(true)
                            Divider()
                            VStack(alignment: .leading){
                                HStack {
                                    Image("epicgame").resizable().frame(width: 30, height: 30)
                                    Text("Epic Games")
                                        .font(.system(size: 20)).bold()
                                    Spacer()
                                    NavigationLink(destination: MoreMenu(storeid: 2)){
                                        Text("More")
                                    }
                                }.padding(.all, 13.0)
                                LazyVGrid(columns: gridlayout, spacing: 0){
                                    ForEach(EpicSortedVM.games, id:\.self){
                                        game in
                                        VStack {
                                            VStack{
                                                ZStack(alignment:.bottomLeading){
                                                    VStack{
                                                        ImageURL(urlImg: game.thumb)
                                                        Rectangle().fill(Color.red).frame(width: 180, height: 50, alignment: .bottomLeading).overlay(Text(game.savings.prefix(2) + "% OFF").foregroundColor(.white).bold())
                                                        Text(game.title)
                                                            .bold().lineLimit(1).padding()
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
                                                    .frame(width: 170, height: 220).background(.white)
                                                    
                                                }
                                                .cornerRadius(10)
                                            }.shadow(color: Color.gray, radius: 4)
                                        }
                                        .padding([.leading, .bottom, .trailing])
                                    }
                                }
                                .onAppear{
                                    EpicSortedVM.fetch()
                                }
                                Spacer()
                            }
                            .navigationBarHidden(true)
                            Divider()
                            VStack(alignment: .leading){
                                HStack {
                                    Image("origin").resizable().frame(width: 30, height: 30)
                                    Text("Origin")
                                        .font(.system(size: 20)).bold()
                                    Spacer()
                                    NavigationLink(destination: MoreMenu(storeid: 3)){
                                        Text("More")
                                    }
                                }.padding(.all, 13.0)
                                LazyVGrid(columns: gridlayout, spacing: 0){
                                    ForEach(OriginSortedVM.games, id:\.self){
                                        game in
                                        VStack {
                                            VStack{
                                                ZStack(alignment:.bottomLeading){
                                                    VStack{
                                                        ImageURL(urlImg: game.thumb)
                                                        Rectangle().fill(Color.red).frame(width: 180, height: 50, alignment: .bottomLeading).overlay(Text(game.savings.prefix(2) + "% OFF").foregroundColor(.white).bold())
                                                        Text(game.title)
                                                            .bold().lineLimit(1).padding()
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
                                                    .frame(width: 170, height: 220).background(.white)
                                                    
                                                }
                                                .cornerRadius(10)
                                            }.shadow(color: Color.gray, radius: 4)
                                        }
                                        .padding([.leading, .bottom, .trailing])
                                    }
                                }
                                .onAppear{
                                    OriginSortedVM.fetch()
                                }
                                Spacer()
                            }
                            .navigationBarHidden(true)
                            Divider()
                            VStack(alignment: .leading){
                                HStack {
                                    Image("gamersgate").resizable().frame(width: 30, height: 30)
                                    Text("GamersGate")
                                        .font(.system(size: 20)).bold()
                                    Spacer()
                                    NavigationLink(destination: MoreMenu(storeid: 4)){
                                        Text("More")
                                    }
                                }.padding(.all, 13.0)
                                LazyVGrid(columns: gridlayout, spacing: 0){
                                    ForEach(GGSortedVM.games, id:\.self){
                                        game in
                                        VStack {
                                            VStack{
                                                ZStack(alignment:.bottomLeading){
                                                    VStack{
                                                        ImageURL(urlImg: game.thumb)
                                                        Rectangle().fill(Color.red).frame(width: 180, height: 50, alignment: .bottomLeading).overlay(Text(game.savings.prefix(2) + "% OFF").foregroundColor(.white).bold())
                                                        Text(game.title)
                                                            .bold().lineLimit(1).padding()
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
                                    GGSortedVM.fetch()
                                }
                                Spacer()
                            }
                            .navigationBarHidden(true)
                            Divider()
                            VStack(alignment: .leading){
                                HStack {
                                    Image("gamesplanet").resizable().frame(width: 30, height: 30)
                                    Text("Gamesplanet")
                                        .font(.system(size: 20)).bold()
                                    Spacer()
                                    NavigationLink(destination: MoreMenu(storeid: 5)){
                                        Text("More")
                                    }
                                }.padding(.all, 13.0)
                                LazyVGrid(columns: gridlayout, spacing: 0){
                                    ForEach(GPSortedVM.games, id:\.self){
                                        game in
                                        VStack {
                                            VStack{
                                                ZStack(alignment:.bottomLeading){
                                                    VStack{
                                                        ImageURL(urlImg: game.thumb)
                                                        Rectangle().fill(Color.red).frame(width: 180, height: 50, alignment: .bottomLeading).overlay(Text(game.savings.prefix(2) + "% OFF").foregroundColor(.white).bold())
                                                        Text(game.title)
                                                            .bold().lineLimit(1).padding()
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
                                                    .frame(width: 170, height: 220).background(.white)
                                                    
                                                }
                                                .cornerRadius(10)
                                            }.shadow(color: Color.gray, radius: 4)
                                        }
                                        .padding([.leading, .bottom, .trailing])
                                    }
                                }
                                .onAppear{
                                    GPSortedVM.fetch()
                                }
                                Spacer()
                            }
                            .navigationBarHidden(true)
                        }
                        
                    }
                }
                
            }
        }
    }
}


struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu().environmentObject(UserWish())
    }
}
