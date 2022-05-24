//
//  ViewModel.swift
//  TetaLab Test
//
//  Created by Liana Tokarevych on 24.05.2022.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var dataSource: [ArticleModel] = []
    
    func getNews() {
        NetworkManager.shared.getNews { data in
            self.dataSource = data.articles
        } error: {
            self.dataSource = []
        }
    }
}
