//
//  ContentView.swift
//  IOSCooLDeveloper
//
//  Created by Çağatay Yıldız on 30.07.2023.
//

import SwiftUI

struct ContentView: View {
   @State var categortList : [Category] = [];
    var body: some View {
        SplashScreen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
