//
//  ViewModel.swift
//  TetaLab Test
//
//  Created by Liana Tokarevych on 24.05.2022.
//

import Foundation

class ViewModel: ObservableObject {
    @Published private var dataSource: [ArticleModel] = []
    @Published var searchText: String = ""
    
    var searchResults: [ArticleModel] {
        if searchText.isEmpty {
            return dataSource
        } else {
            return dataSource.filter { article in
                if let description = article.description {
                    return article.title.lowercased().contains(searchText.lowercased()) || article.source.name.lowercased().contains(searchText.lowercased()) || description.lowercased().contains(searchText.lowercased())
                } else {
                    return article.title.lowercased().contains(searchText.lowercased()) || article.source.name.lowercased().contains(searchText.lowercased())
                }
            }
        }
    }
    
    func getNews() {
        NetworkManager.shared.getNews { data in            
            data.articles.forEach { article in
                var model = ArticleModel(source: article.source, title: article.title, description: article.description, url: article.url, urlToImage: article.urlToImage, publishedAt: article.publishedAt, imageData: nil)
            
                if let str = article.urlToImage, let url = URL(string: str) {
                    model.imageData = try? Data(contentsOf: url)
                }
                
                self.dataSource.append(model)
            }
        } error: {
            self.dataSource = []
        }
    }
}
