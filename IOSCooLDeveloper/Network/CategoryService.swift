//
//  ProductService.swift
//  IOSCooLDeveloper
//
//  Created by Çağatay Yıldız on 30.07.2023.
//

import Foundation
import Alamofire



func GetAllCategories(completionHandler: @escaping ([Category]) -> Void ){
    
    var categories : [Category] = [];
    
    let request = AF.request("https://northwind.vercel.app/api/categories")
              
    request.responseDecodable(of: [Category].self){response in
              
    categories = response.value ?? []
    
        completionHandler(categories)
              
    }
    
    
}



