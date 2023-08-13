//
//  FavoritesMain.swift
//  IOSCooLDeveloper
//
//  Created by Çağatay Yıldız on 30.07.2023.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoriteStore : FavoriteStore;
    
    var body: some View {
        VStack{
            ForEach(favoriteStore.favorites, id:\.id){item in
                Text(item.position ?? "")
                Button("Remove to fav"){
                    favoriteStore.favorites = favoriteStore.favorites.filter({$0.id != item.id})
                    
                    do {
                    
                        let encodedData = try JSONEncoder().encode(favoriteStore.favorites)
                        let userDefaults = UserDefaults.standard
                        userDefaults.set(encodedData, forKey: "favorites")
                        
                        print("SAVED");

                    } catch {
                        print("ERROR");
                    }
                }
            }
        }
    }
}

