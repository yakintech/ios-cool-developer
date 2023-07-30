//
//  Tab.swift
//  IOSCooLDeveloper
//
//  Created by Çağatay Yıldız on 30.07.2023.
//

import SwiftUI

struct Tab: View {
    @StateObject var settings = CounterStore()
    var body: some View {

        
        NavigationView{
            TabView{
                
                JobsView()
                    .tabItem{
                        Label("Jobs", systemImage: "bag.fill")
                    }
                
                FavoritesView()
                    .tabItem{
                        Label("Jobs", systemImage: "star.fill")
                    }
                
                ProfileView()
                    .tabItem{
                        Label("Profile", systemImage: "person.fill")
                    }
                
            }
            .environmentObject(settings)
        }
       
    }
}

struct Tab_Previews: PreviewProvider {
    static var previews: some View {
        Tab()
    }
}
