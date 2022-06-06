//
//  UserWish.swift
//  AFL4
//
//  Created by SIFT - Telkom DBT Air 4 on 06/06/22.
//

import Foundation

@MainActor class UserWish:ObservableObject{
    
    let savekey = "wishlist"
    
    @Published var wishdata:[Game]{
        didSet{
            savewish()
        }
    }
    
    init(){
        wishdata = []
        loadonopen()
    }
    
    func checkGames(_ game:Game) -> Bool{
        wishdata.contains(game)
    }
    
    func addGames(_ game:Game){
        wishdata.append(game)
    }
    
    func savewish(){
        if let dataencoded = try? JSONEncoder().encode(wishdata){
            UserDefaults.standard.set(dataencoded, forKey: savekey)
        }
    }
    
    func loadonopen(){
        guard let data = UserDefaults.standard.data(forKey: savekey),
              let datadecoded = try? JSONDecoder().decode([Game].self, from: data)
        else {
            return
        }
        
        self.wishdata = datadecoded
    }
}
