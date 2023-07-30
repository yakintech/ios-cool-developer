//
//  ProfileMain.swift
//  IOSCooLDeveloper
//
//  Created by Çağatay Yıldız on 30.07.2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var counterStore : CounterStore;
    var body: some View {
        VStack{
            
            Button("Increase"){
                counterStore.counter = counterStore.counter + 1
            }
            
            Text(String(counterStore.counter))
                .font(.largeTitle)
        }
    }
}

