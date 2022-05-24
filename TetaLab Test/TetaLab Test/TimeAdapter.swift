//
//  TimeAdapter.swift
//  TetaLab Test
//
//  Created by Liana Tokarevych on 24.05.2022.
//

import Foundation

class TimeAdapter {
    static func convertTime(time: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        
        guard let firstDate = formatter.date(from: time) else { return "" }
        formatter.dateFormat = "HH:mm"
        
        let secondDate = formatter.string(from: firstDate)
        return secondDate
    }
}
