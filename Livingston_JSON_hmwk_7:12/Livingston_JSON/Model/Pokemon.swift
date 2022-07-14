//
//  Pokemon.swift
//  Livingston_JSON
//
//  Created by Consultant on 7/12/22.
//

import Foundation

struct Pokemon {
    // starts off as base dictionary

    let damage_relations: DamageRelations
    let game_indices: [GameIndex]
    let generation: NameLink
    let id: Int
    let move_damage_class: NameLink
    let moves: [NameLink]
    let name: String 
    let pokemon: [Pkm]
    // calls the struct Pokemon
} // end of Pokemon

struct DamageRelations {
    let double_damage_from: [NameLink]
    let double_damage_to: [NameLink]
    let half_damage_from: [NameLink]
    let half_damage_to: [NameLink]
    let no_damage_from: [NameLink]
    let no_damage_to: [NameLink]
    // one for each inside of damage_relations...
}


struct NameLink { // only for those with these two specifically
    let name: String
    let url: String
}

struct GameIndex {
    let gameIndex: Int // name
    let version: NameLink // url
} // end of gameindex

struct Pkm { // for name: dragon, pokemon
    let slot: Int
    let pokeMon: NameLink
}
