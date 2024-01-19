//
//  NewsManager.swift
//  News
//
//  Created by Ahmet Tunahan Bekdaş on 18.01.2024.
//


import Foundation

class NewsManager {
    func fetchNewData(completion: @escaping([Article]?) -> ()) {// Verileri getiren fonksiyon
        let url = URL(string: Constant.ServicesEndPoint.newsServicesEndPoint())// NewsAPI'ye yapılan isteğin URL'si
        
        URLSession.shared.dataTask(with: url!) { data, response, error in//URLSession ile asenkron ile veri isteği yapılır
            if let error = error{//Hata kontrolü
                print(error.localizedDescription)
                completion(nil)
            }
            if let selfData = data {//Veri varsa işlemler yapılır
                let news = try? JSONDecoder().decode(NewsModel.self, from: selfData)//Veriyi NewsModel sınıfına çevirme
                if let selfNews = news {//Çevirme işlemi başarılıysa, al ve tamamla
                    completion(selfNews.articles)
                }
            }
        }.resume()
    }
}
