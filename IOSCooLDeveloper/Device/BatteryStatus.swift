//
//  BatteryStatus.swift
//  IOSCooLDeveloper
//
//  Created by Çağatay Yıldız on 19.08.2023.
//

import SwiftUI

struct BatteryStatus: View {
    @State var level = 0.0
    
    var body: some View {
        VStack{
                
            Text("Battery Level: %" + String(level * 100))
                .font(.largeTitle)
                
        }
        .onAppear(){
            UIDevice.current.isBatteryMonitoringEnabled = true
            level = Double(UIDevice.current.batteryLevel)
         }
    }
}

struct BatteryStatus_Previews: PreviewProvider {
    static var previews: some View {
        BatteryStatus()
    }
}
