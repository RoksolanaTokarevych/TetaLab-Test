//
//  NetworkManager.swift
//  TetaLab Test
//
//  Created by Liana Tokarevych on 24.05.2022.
//

import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func getNews(success: @escaping (_ data: DataModel) -> Void, error: @escaping () -> Void) {
        AF.request("https://newsapi.org/v2/top-headlines?country=ua", method: .get, parameters: ["apiKey": "24311122f65c485186d393296ae29afb"], encoding: URLEncoding.default).responseDecodable(of: DataModel.self) { response in
            
            if let data = response.value {
                success(data)
            } else {
                error()
            }
        }
    }
}
