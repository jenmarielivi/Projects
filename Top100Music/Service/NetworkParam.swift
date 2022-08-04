//
//  NetworkParam.swift
//  tab_bar_practice
//
//  Created by Consultant on 7/23/22.
//

import Foundation
enum NetwokParams {
    // see video NetworkParam 2hr 8min
    private enum NetworkConstants {
        static let albumBase = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/100/albums.json"
       // static let baseImage = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/w100"
    }

    case albumMusic // is this an int?
    case albumImage(String)
    
    var url: URL? {
        switch self {
        case .albumMusic:
            let component = URL(string: NetworkConstants.albumBase)
 
            return component
            
        case .albumImage(let urlImg):
           // let albumBase = URL(string: NetworkConstants.urlImg)
           
            return URL(string: urlImg)
            
            // return url = URL(string: urlImg, relativeTo: albumBase)
            
            //  return URL(string: NetworkConstants.albumImage + urlImg)

//            let albumBase = URL(string: urlImg)
//            let url = URL(string: relativeTo:
//            return albumBase
        }
    }
}
