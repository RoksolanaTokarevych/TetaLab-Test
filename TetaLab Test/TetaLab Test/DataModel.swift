//
//  DataModel.swift
//  TetaLab Test
//
//  Created by Liana Tokarevych on 24.05.2022.
//

import Foundation

struct DataModel: Decodable {
    var articles: [ArticleModel]
}

struct ArticleModel: Decodable {
    var source: SourseModel
    var title: String
    var deckription: String
    var url: String
    var urlYoImage: String
    var publishedAt: String
}

struct SourseModel: Decodable {
    var name: String
}
