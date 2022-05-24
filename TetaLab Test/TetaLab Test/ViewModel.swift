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
            self.dataSource = data.articles
        } error: {
            self.dataSource = []
        }
    }
}
