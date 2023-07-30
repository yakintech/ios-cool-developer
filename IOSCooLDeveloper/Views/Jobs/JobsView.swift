//
//  JobsMain.swift
//  IOSCooLDeveloper
//
//  Created by Çağatay Yıldız on 30.07.2023.
//

import SwiftUI

struct JobsView: View {
    
    @State var jobs : [JobDataModel] = []
    @EnvironmentObject var counterStore : CounterStore;
    var body: some View {
    
        
        ScrollView{
            VStack{
               
                ForEach(jobs, id: \.id){item in
                    
                    NavigationLink(destination: JobDetailView(id: item.id)) {
                        Text(item.title)
                            .font(.largeTitle)
                            .padding()
                       }
                    Button("Add to fav"){
                        
                    }
                   
                    
                }
                
            }
            .onAppear(){
                
                GetAllJobs(){data in
                    jobs = data
                }
            }
        }
      
        
    }
}

struct JobsView_Previews: PreviewProvider {
    static var previews: some View {
        JobsView()
    }
}
