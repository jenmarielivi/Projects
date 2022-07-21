//
//  Pokemon.swift
//  ProjectPokedexRev2
//
//  Created by Consultant on 7/16/22.
//

import Foundation


struct Pokemon: Decodable {
    
    let abilities: [Ability]
    let height: Int
    let id: Int
    let moves: [Move]
    let name: String
    let sprites: Sprites
    let stats: [Stats]
    let types: [LiteralType]
    let weight: Int
}

struct Ability: Decodable {
    
    let ability: NameLink
    let hidden: Bool
    let slot: Int
    
    enum CodingKeys: String, CodingKey {
        case hidden = "is_hidden"
        case ability, slot
    }
}

struct Move: Decodable {
    let move: NameLink
}



struct Sprites: Decodable {
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "font_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }
}

struct Stats: Decodable {
    let base_stat: Int
    let effort: Int
    let stat: NameLink
}

struct LiteralType: Decodable {
    let type: typeRepeat
}

struct typeRepeat: Decodable {
    let name: String
}

struct NameLink: Decodable {
    let name: String
   
}
