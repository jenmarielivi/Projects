//
//  NetworkParams.swift
//  football_api_swiftUI
//
//  Created by Consultant on 8/20/22.
//

import Foundation

enum NetworkParams{
    
    private struct NetworkConstants {
        static let FootballListBase = "https://api-football-standings.azharimm.site/leagues"
        static let FootballImagesBase = "https://a.espncdn.com/i/leaguelogos/soccer/500/" // this part is same for each image.. followed by a number.png
    }
    
    case FottballList(Int)
    case FootballImages(String)
    
    var url: URL?{
        switch self {
        case .FottballList(let page):
            var component = URL(string: NetworkConstants.FootballListBase)
        return component
        case .FootballImages(let urlImage):
            return URL(string: urlImage)
        }
    }
    
}
