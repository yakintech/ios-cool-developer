//
//  JobsMain.swift
//  IOSCooLDeveloper
//
//  Created by Çağatay Yıldız on 30.07.2023.
//

import SwiftUI
import Combine

struct JobsView: View {
    
    @State var jobs : [JobDataModel] = []
    @State var originalData : [JobDataModel] = []
    @EnvironmentObject var favoriteStore : FavoriteStore;
    @State var search: String = ""
    var body: some View {
       
        
        ScrollView{
            
            VStack{
                TextField("Search Job by title", text: $search)
                    .onReceive(Just(search)) { data in
                        
                    
                           
                              }
                    .padding()
                    .border(.black)

                Text("Length: \(jobs.count)")
                    .padding()
                ForEach(jobs, id: \.id){item in
                    if item.position != nil {
                        NavigationLink(destination: JobDetailView(detail: item)) {
                            VStack{
                                Text(item.position ?? "")
                                    .font(.largeTitle)
                                    .padding()
                                
                                Text(item.company ?? "")
                                    .font(.largeTitle)
                                    .padding()
                                
                   
                           
                                //AsyncImage(url: URL(string: item.company_logo ?? ""),
                                    //content: { image in
                                    //image.resizable()
                                    //     .aspectRatio(contentMode: .fit)
                                  //       .frame(maxWidth: 300, maxHeight: 100)
                                //},
                                //placeholder: {
                                  //  ProgressView()
                                //})
                              
                                
                            }
                            .border(.black)
                           }
                            
                        
                    }
                  
                    Button{
                        let favoritesControl = favoriteStore.favorites.first(where: {$0.id == item.id})

                        if favoritesControl == nil{
                            favoriteStore.favorites.append(item)
                        }
                        else{
                            favoriteStore.favorites = favoriteStore.favorites.filter({$0.id != item.id})
                        }
                       
                        do {
                        
                            let encodedData = try JSONEncoder().encode(favoriteStore.favorites)
                            let userDefaults = UserDefaults.standard
                            userDefaults.set(encodedData, forKey: "favorites")
                            
                            print("SAVED");

                        } catch {
                            print("ERROR");
                        }
                       
                        
                        
                    } label: {
                        let favoritesControl = favoriteStore.favorites.first(where: {$0.id == item.id})
                        if favoritesControl == nil{
                            Image(systemName: "star")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                               .frame(width: 30.0, height: 30.0, alignment: .center)
                        }
                        else{
                            Image(systemName: "star.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                               .frame(width: 30.0, height: 30.0, alignment: .center)
                        }
                            
                          
                    }
                   
                    
                }
                
            }
            .onAppear(){
                
                GetAllJobs(){data in
                    jobs = data
                    originalData = data
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
