//
//  Constant.swift
//  News
//
//  Created by Ahmet Tunahan Bekdaş on 18.01.2024.
//

// https://newsapi.org/v2/top-headlines?country=us&apiKey=dcbf3c143b0c47a8aa7046bb1fd0683e

import Foundation


struct Constant {
     
}

//MARK: - URL CONSTANT
extension Constant {
    
    enum ServicesEndPoint: String {
        case BASE_URL = "https://newsapi.org/v2/top-headlines?country=us&"
        case API_KEY = "apiKey=dcbf3c143b0c47a8aa7046bb1fd0683e"
        
        static func newsServicesEndPoint() -> String {
            "\(BASE_URL.rawValue)\(API_KEY.rawValue)"
        }
    }
    
    
}
