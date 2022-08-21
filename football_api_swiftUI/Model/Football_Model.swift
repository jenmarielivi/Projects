//
//  Football_Model.swift
//  football_api_swiftUI
//
//  Created by Consultant on 8/20/22.
//

import Foundation

struct Football: Decodable{
    
    var status: Bool
    var data: [DataValue]
}

struct DataValue: Decodable{
    let id: String
    let name: String
    let logos: logo // url light - and dark option
    
    enum CodingKeys: String, CodingKey{
        case id = "id"
        case name = "name"
        case logos = "logos" // might be how you access the light/dark
    }
}

struct logo: Decodable{
    let logo: String
    
    enum CodingKeys: String, CodingKey{
        case logo = "light"
    }
}
