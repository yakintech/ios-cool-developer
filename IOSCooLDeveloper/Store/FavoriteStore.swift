//
//  FavoriteStore.swift
//  IOSCooLDeveloper
//
//  Created by Çağatay Yıldız on 12.08.2023.
//

import Foundation

class FavoriteStore : ObservableObject{
    @Published var favorites : [JobDataModel] = []
}

