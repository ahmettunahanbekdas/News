//
//  NewsViewModel.swift
//  News
//
//  Created by Ahmet Tunahan Bekdaş on 18.01.2024.
//

import Foundation

//MARK: - NewsListViewModel

struct NewsListViewModel {
    let newsList : [Article]
}

extension NewsListViewModel {
    func numberOfSection(_ section : Int) -> Int {
        return newsList.count
    }
    
    func newsAtIndex(_ index : Int) -> NewsViewModel {
        let news = self.newsList[index]
        return NewsViewModel(news: news)
    }
}

//MARK: - NewsViewModel

struct NewsViewModel {
    let news : Article
}
extension NewsViewModel {
    var title : String {
        return news.title
    }
    var url : String {
        return news.url
    }
    var urlToImage : String {
        guard let image = news.urlToImage else { return "" }
        return image
    }
}
