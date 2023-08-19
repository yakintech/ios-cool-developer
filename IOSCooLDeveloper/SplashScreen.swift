//
//  SplashScreen.swift
//  IOSCooLDeveloper
//
//  Created by Çağatay Yıldız on 19.08.2023.
//

import SwiftUI

struct SplashScreen: View {
    @State var isActive: Bool = false
        
        var body: some View {
            ZStack {
                if self.isActive {
                    Tab()
                } else {
                    Rectangle()
                        .background(Color.black)
                    Image("splashScreen")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                }
            }
            .onAppear {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
