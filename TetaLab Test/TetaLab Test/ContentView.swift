//
//  ContentView.swift
//  TetaLab Test
//
//  Created by Liana Tokarevych on 23.05.2022.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.dataSource, id: \.title) { article in
                MainListCell(article: article)
                    .listRowBackground(Color.gray)
            }
            .listStyle(.plain)
            .onAppear {
                viewModel.getNews()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
