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
            Image(uiImage: uiimage).resizable().aspectRatio(contentMode: .fill).frame(width:180, height: 130)
                .background(.white)
        } else {
            Image(systemName: "cart").resizable().frame(width: 180, height: 130).aspectRatio(contentMode: .fit).background(.gray).onAppear{
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
    @StateObject var gameindex = GameIndex()
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
                                }
                                .padding([.top, .leading, .trailing], 15.0)
                                LazyVGrid(columns: gridlayout, spacing: 20){
                                    ForEach(SteamSortedVM.games, id:\.self){
                                        game in
                                        VStack {
                                            VStack{
                                                ZStack(alignment:.bottomLeading){
                                                    VStack{
                                                        ImageURL(urlImg: game.thumb)
                                                        Rectangle().fill(Color.red).frame(width: 180, height: 34, alignment: .bottomLeading).overlay(Text(game.savings.prefix(2) + "% OFF").foregroundColor(.white).bold())
                                                        Text(game.title)
                                                            .bold()
                                                        Button("Add to wishlist"){
                                                            
                                                        }
                                                        .background(.white).frame(height:40).buttonStyle(.bordered)
                                                        .padding(.bottom, 50)
                                                        .cornerRadius(10)
                                                    }
                                                    
                                                    .frame(width: 180, height: 220).background(.white)
                                                    
                                                }
                                                .cornerRadius(10)
                    
                                            }.shadow(color: Color.gray, radius: 2, x: 4, y: 4)
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
                                    Button("More"){
                                        
                                    }
                                }
                                .padding([.top, .leading, .trailing], 15.0)
                                LazyVGrid(columns: gridlayout, spacing: 0){
                                    ForEach(EpicSortedVM.games, id:\.self){
                                        game in
                                        VStack {
                                            VStack{
                                                ZStack(alignment:.bottomLeading){
                                                    VStack{
                                                        ImageURL(urlImg: game.thumb)
                                                        Rectangle().fill(Color.red).frame(width: 180, height: 34, alignment: .bottomLeading).overlay(Text(game.savings.prefix(2) + "% OFF").foregroundColor(.white).bold())
                                                        Text(game.title)
                                                            .bold()
                                                        Button("Add to wishlist"){
                                                            
                                                        }
                                                        .background(.white).frame(height:40).buttonStyle(.bordered)
                                                        .padding(.bottom, 50)
                                                        .cornerRadius(10)
                                                    }
                                                    .frame(width: 180, height: 220).background(.white)
                                                    
                                                }
                                                .cornerRadius(10)
                                            }.shadow(color: Color.gray, radius: 2, x: 4, y: 4)
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
                                    Button("More"){
                                        
                                    }
                                }
                                .padding([.top, .leading, .trailing], 15.0)
                                LazyVGrid(columns: gridlayout, spacing: 0){
                                    ForEach(OriginSortedVM.games, id:\.self){
                                        game in
                                        VStack {
                                            VStack{
                                                ZStack(alignment:.bottomLeading){
                                                    VStack{
                                                        ImageURL(urlImg: game.thumb)
                                                        Rectangle().fill(Color.red).frame(width: 180, height: 34, alignment: .bottomLeading).overlay(Text(game.savings.prefix(2) + "% OFF").foregroundColor(.white).bold())
                                                        Text(game.title)
                                                            .bold()
                                                        Button("Add to wishlist"){
                                                            
                                                        }
                                                        .background(.white).frame(height:40).buttonStyle(.bordered)
                                                        .padding(.bottom, 50)
                                                        .cornerRadius(10)
                                                    }
                                                    .frame(width: 180, height: 220).background(.white)
                                                    
                                                }
                                                .cornerRadius(10)
                                            }.shadow(color: Color.gray, radius: 2, x: 4, y: 4)
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
                                    Button("More"){
                                        
                                    }
                                }
                                .padding([.top, .leading, .trailing], 15.0)
                                LazyVGrid(columns: gridlayout, spacing: 0){
                                    ForEach(GGSortedVM.games, id:\.self){
                                        game in
                                        VStack {
                                            VStack{
                                                ZStack(alignment:.bottomLeading){
                                                    VStack{
                                                        ImageURL(urlImg: game.thumb)
                                                        Rectangle().fill(Color.red).frame(width: 180, height: 34, alignment: .bottomLeading).overlay(Text(game.savings.prefix(2) + "% OFF").foregroundColor(.white).bold())
                                                        Text(game.title)
                                                            .bold()
                                                        Button("Add to wishlist"){
                                                            
                                                        }
                                                        .background(.white).frame(height:40).buttonStyle(.bordered)
                                                        .padding(.bottom, 50)
                                                        .cornerRadius(10)
                                                    }
                                                    .frame(width: 180, height: 220).background(.white)
                                                    
                                                }
                                                .cornerRadius(10)
                                            }.shadow(color: Color.gray, radius: 2, x: 4, y: 4)
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
                                    Button("More"){
                                        
                                    }
                                }
                                .padding([.top, .leading, .trailing], 15.0)
                                LazyVGrid(columns: gridlayout, spacing: 0){
                                    ForEach(GPSortedVM.games, id:\.self){
                                        game in
                                        VStack {
                                            VStack{
                                                ZStack(alignment:.bottomLeading){
                                                    VStack{
                                                        ImageURL(urlImg: game.thumb)
                                                        Rectangle().fill(Color.red).frame(width: 180, height: 34, alignment: .bottomLeading).overlay(Text(game.savings.prefix(2) + "% OFF").foregroundColor(.white).bold())
                                                        Text(game.title)
                                                            .bold()
                                                        Button("Add to wishlist"){
                                                            
                                                        }
                                                        .background(.white).frame(height:40).buttonStyle(.bordered)
                                                        .padding(.bottom, 50)
                                                        .cornerRadius(10)
                                                    }
                                                    .frame(width: 180, height: 220).background(.white)
                                                    
                                                }
                                                .cornerRadius(10)
                                            }.shadow(color: Color.gray, radius: 2, x: 4, y: 4)
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
        Menu()
    }
}
