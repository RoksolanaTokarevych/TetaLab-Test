//
//  MainListCell.swift
//  TetaLab Test
//
//  Created by Liana Tokarevych on 23.05.2022.
//

import SwiftUI

struct MainListCell: View {
    @State private var topPadding: CGFloat = 10
    @State private var bottomPadding: CGFloat = 10
    @State var article: ArticleModel
    
    var body: some View {
        VStack {
            if let imageData = article.imageData, let image = UIImage(data: imageData) {
                Image(uiImage: image)
                    .resizable()
                    .frame(height: 70)
                    .cornerRadius(12)
                    .padding(.top, 10)
                    .padding(.horizontal, 10)
                    .onAppear {
                        topPadding = CGFloat(0)
                    }
            }
            
            HStack {
                Circle()
                    .frame(width: 24, height: 24, alignment: .center)
                    .foregroundColor(.blue)
                Text(article.title)
                    .font(.title2)
                    .padding(.horizontal, 5)
                    .lineLimit(1)
                
                Spacer()
                
                Text(TimeAdapter.convertTime(time: article.publishedAt))
                    .font(.headline)
                    .foregroundColor(.gray)
                    .lineLimit(1)
                if let url = URL(string: article.url) {
                    Link(destination: url) {
                        Image(systemName: "chevron.forward")
                            .foregroundColor(.gray)
                    }.buttonStyle(BorderlessButtonStyle())
                        .padding(.trailing, 5)
                }
            }
            .padding(.top, topPadding)
            .padding(.horizontal, 10)
            
            HStack {
                Text(article.source.name)
                    .font(.subheadline)
                    .lineLimit(1)
                
                Spacer()
            }
            .padding(.horizontal, 30)
            .padding(.bottom, bottomPadding)
            
            if let description = article.description, !description.isEmpty {
                HStack {
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .lineLimit(1)
                    
                    Spacer()
                }.onAppear {
                    bottomPadding = CGFloat(0)
                }
                .padding(.bottom, 10)
                .padding(.horizontal, 30)
            }
        }
        .background(Color.white)
    }
}

struct MainListCell_Previews: PreviewProvider {
    static var previews: some View {
        MainListCell(article: ArticleModel(source: SourseModel(name: "qwe"), title: "sdf", description: "nm", url: "fcg", urlToImage: "cv", publishedAt: "poiuy"))
    }
}
