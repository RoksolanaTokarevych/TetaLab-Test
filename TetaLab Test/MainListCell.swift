//
//  MainListCell.swift
//  TetaLab Test
//
//  Created by Liana Tokarevych on 23.05.2022.
//

import SwiftUI

struct MainListCell: View {
    var body: some View {
        VStack {
            Image(systemName: "person")
                .resizable()
                .frame(width: UIScreen.main.bounds.width - 20, height: 70, alignment: .center)
                .cornerRadius(12)

            HStack {
                Circle()
                    .frame(width: 24, height: 24, alignment: .center)
                    .foregroundColor(.blue)
                Text("AZsdxfcgvhbjknlmp;[o0i9awds")
                    .font(.title2)
                    .padding(.horizontal, 5)
                    .lineLimit(1)
                
                Spacer()
                
                Text("NZG")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .lineLimit(1)
                Link(destination: URL(string: "https://www.apple.com")!) {
                    Image(systemName: "arrow.right")
                }.padding(.trailing, 5)
            }
            
            HStack {
                Text("ZMV")
                    .font(.subheadline)
                    .lineLimit(1)
                
                Spacer()
            }
            .padding(.horizontal, 30)
            
            HStack {
                Text("YNNZ")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(1)
                
                Spacer()
            }
            .padding(.horizontal, 30)
        }.padding(.all, 10)
    }
}

struct MainListCell_Previews: PreviewProvider {
    static var previews: some View {
        MainListCell()
    }
}
