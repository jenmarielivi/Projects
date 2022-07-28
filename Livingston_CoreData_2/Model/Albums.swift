//
//  Music.swift
//  tab_bar_practice
//
//  Created by Consultant on 7/23/22.
//

import Foundation


struct Album: Decodable{
    var feed: Feed
}

struct Feed: Decodable{
    var results: [Results] // name and url
}


struct Results: Decodable{
    let artistName: String // artists name
    let name: String  // name of album
    let releaseDate: String  // date of release
    let artworkUrl100: String  // image of artwork
    let genres: [Genres] // list of genres
    
}

struct Genres: Decodable{ // only list of genres
     let name: String
}

