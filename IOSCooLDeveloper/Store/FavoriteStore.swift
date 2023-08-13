//
//  FavoriteStore.swift
//  IOSCooLDeveloper
//
//  Created by Çağatay Yıldız on 12.08.2023.
//

import Foundation

//as anahtar kelimesi ile userdefault içerisindeki string datayı kendi modelime convert ettim!

class FavoriteStore : ObservableObject{
    @Published var favorites : [JobDataModel] = []
    
    init(){
        let userDefaults = UserDefaults.standard
        // 1
        if let savedData = userDefaults.object(forKey: "favorites") as? Data  {

            do{
                // 2
                let favList = try JSONDecoder().decode([JobDataModel] .self, from: savedData)
                favorites = favList;

            } catch {
                // Failed to convert Data to Contact
            }
        }
    }
}

