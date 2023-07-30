//
//  FavoritesMain.swift
//  IOSCooLDeveloper
//
//  Created by Çağatay Yıldız on 30.07.2023.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var counterStore : CounterStore;
    
    var body: some View {
        VStack{
            Text(String(counterStore.counter))
                .font(.largeTitle)
        }
    }
}

