//
//  NewsModel.swift
//  News
//
//  Created by Ahmet Tunahan Bekdaş on 18.01.2024.
//

import Foundation

// MARK: - Welcome
struct NewsModel: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let title: String
    let url: String
    let urlToImage: String? //Bazı fotoğraflar gelmediği için optional olarak verdi
}


