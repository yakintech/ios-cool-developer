//
//  Tab.swift
//  IOSCooLDeveloper
//
//  Created by Çağatay Yıldız on 30.07.2023.
//

import SwiftUI

struct Tab: View {
    @StateObject var favorites = FavoriteStore()
    var body: some View {

        
        NavigationView{
            TabView{
                
                JobsView()
                    .tabItem{
                        Label("Jobs", systemImage: "bag.fill")
                    }
                
                FavoritesView()
                    .tabItem{
                        Label("Favorites", systemImage: "star.fill")
                    }
                    .badge(favorites.favorites.count)
                
                ProfileView()
                    .tabItem{
                        Label("Profile", systemImage: "person.fill")
                    }
                
            }
           
        }
        .environmentObject(favorites)
       
    }
}

struct Tab_Previews: PreviewProvider {
    static var previews: some View {
        Tab()
    }
}
