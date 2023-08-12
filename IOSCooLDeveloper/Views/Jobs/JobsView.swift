//
//  JobsMain.swift
//  IOSCooLDeveloper
//
//  Created by Çağatay Yıldız on 30.07.2023.
//

import SwiftUI

struct JobsView: View {
    
    @State var jobs : [JobDataModel] = []
    @EnvironmentObject var favoriteStore : FavoriteStore;
    var body: some View {
    
        
        ScrollView{
            VStack{
               
                Text("Length: \(jobs.count)")
                    .padding()
                ForEach(jobs, id: \.id){item in
                    
                    NavigationLink(destination: JobDetailView(detail: item)) {
                        VStack{
                            Text(item.position ?? "")
                                .font(.largeTitle)
                                .padding()
                            
                            Text(item.company ?? "")
                                .font(.largeTitle)
                                .padding()
                            
                            AsyncImage(url: URL(string: item.company_logo ?? ""),
                                content: { image in
                                image.resizable()
                                     .aspectRatio(contentMode: .fit)
                                     .frame(maxWidth: 300, maxHeight: 100)
                            },
                            placeholder: {
                                ProgressView()
                            })
                            
                        }
                        .border(.black)
                       }
                    Button("Add to fav"){
                        favoriteStore.favorites.append(item)
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
