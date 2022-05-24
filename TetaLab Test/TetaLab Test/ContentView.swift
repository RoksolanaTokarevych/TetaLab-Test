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
            List(viewModel.searchResults, id: \.title) { article in
                MainListCell(article: article)
                    .listRowBackground(Color(uiColor: .lightGray))
            }
            .listStyle(.plain)
            .navigationBarTitle("", displayMode: .inline)
            .background(Color(uiColor: .lightGray))
            .onAppear {
                UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white
                viewModel.getNews()
            }
        }
        .searchable(text: $viewModel.searchText)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
