//
//  JobService.swift
//  IOSCooLDeveloper
//
//  Created by Çağatay Yıldız on 30.07.2023.
//

import Foundation
import Alamofire



func GetAllJobs(completionHandler: @escaping ([JobDataModel]) -> Void){
    
    var jobs : [JobDataModel] = [];
    
    let request = AF.request("https://64c6233ec853c26efadb2124.mockapi.io/jobs")
    
    request.responseDecodable(of: [JobDataModel].self){response in
              
    jobs = response.value ?? []
    
        completionHandler(jobs)
              
        print(response)
    }
    
    
    
}
