//
//  NetworkManager.swift
//  Livingston_JSON
//
//  Created by Consultant on 7/12/22.
//

import Foundation

class NetworkManager {
    func getPokemonManually() -> Pokemon? {
        guard let path = Bundle.main.path(forResource: "DragonPogo", ofType: "json")
        else { return nil }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let jsonObj = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
            guard let baseDict = jsonObj as? [String: Any] else { return nil }
            return parsePokemonManually(base: baseDict)
        } catch {
            print(error)
        } // end of catch
        return nil
    } // end of getPokemonManually
    
    // [String: Any] dictonary
    // [[String: Any]] array
    
    private func parsePokemonManually(base: [String: Any]) -> Pokemon? {
        
        // ---------     DamageRelations        ---------
        //
        //
        // ---------     double_damage_from        ---------
        guard let DamageArr = base["damage_relations"] as? [String: Any] else { return nil }
        guard let DoubleDamage = DamageArr["double_damage_from"] as? [[String: Any]] else { return nil }
        
        var DDamage: [NameLink] = []
        DoubleDamage.forEach { value in
        guard let moveRep1 = self.createNameLink(dict: value) else { return }
        DDamage.append(moveRep1)
        }
        
        // ---------     double_damage_to        ---------
        guard let DoubleDamage = DamageArr["double_damage_to"] as? [[String: Any]] else { return nil }
        var DDamage1: [NameLink] = []
        
        
        DoubleDamage.forEach { value in
        guard let moveRep2 = self.createNameLink(dict: value) else { return }
        DDamage1.append(moveRep2)}
        
        
        
        // ---------     half_damage_from        ---------
        guard let DoubleDamage = DamageArr["half_damage_from"] as? [[String: Any]] else { return nil }
        var DDamage2: [NameLink] = []
        
        
        DoubleDamage.forEach { value in
        guard let moveRep3 = self.createNameLink(dict: value) else { return }
            DDamage2.append(moveRep3)}
            
        // ---------     half_damage_to        ---------
        guard let DoubleDamage = DamageArr["half_damage_to"] as? [[String: Any]] else { return nil }
        var DDamage3: [NameLink] = []
        
        
        DoubleDamage.forEach { value in
        guard let moveRep4 = self.createNameLink(dict: value) else { return }
            DDamage3.append(moveRep4)}
                    
        // ---------     no_damage_from        ---------
        guard let DoubleDamage = DamageArr["no_damage_from"] as? [[String: Any]] else { return nil }
        var DDamage4: [NameLink] = []
        
        
         DoubleDamage.forEach { value in
         guard let moveRep5 = self.createNameLink(dict: value) else { return }
             DDamage4.append(moveRep5)}
             
        // ---------     no_damage_to        ---------
        guard let DoubleDamage = DamageArr["no_damage_to"] as? [[String: Any]] else { return nil }
        var DDamage5: [NameLink] = []
        
        
        DoubleDamage.forEach { value in
        guard let moveRep6 = self.createNameLink(dict: value) else { return }
            DDamage5.append(moveRep6)}
        
        let damageRelations = DamageRelations(double_damage_from: DDamage,
        double_damage_to: DDamage1, half_damage_from: DDamage2, half_damage_to: DDamage3, no_damage_from: DDamage4, no_damage_to: DDamage5
        )

        // ---------     Name        ---------
        guard let name1 = base["name"] as? String else { return nil }
        
        
        // ---------     ID        ---------
        guard let id = base["id"] as? Int else { return nil }
        
        
        // ---------     moves        ---------
        guard let movesArr = base["moves"] as? [[String: Any]] else { return nil }
        var finalMoves: [NameLink] = []
        
        movesArr.forEach { value in
            guard let moveRep = self.createNameLink(dict: value) else { return }
            finalMoves.append(moveRep)
        }
        
        
        // ---------     move_damage_class        ---------
        guard let damageDict = base["move_damage_class"] as? [String: Any] else { return nil }
        guard let move_damage_class = createNameLink(dict: damageDict) else { return nil }
        
        
        // ---------     Game Indicies        ---------
        guard let gameIndicesArr = base["game_indices"] as?
            [[String: Any]] else { return nil }
        var finalGameIndices: [GameIndex] = []
        gameIndicesArr.forEach { value in
            guard let gameIndex = value["game_indices"] as? Int
            else { return }
            guard let version = value["version"] as? [String: Any]
            else { return }
            guard let returnVersion = self.createNameLink(dict: version) else { return }
            
            finalGameIndices.append(GameIndex(gameIndex: gameIndex, version: returnVersion))
        }
        
        // ---------     Pokemon        ---------
        guard let pokeMonTypeArr = base["pokemon"] as? [[String: Any]] else { return nil }
        var pokeMonTypes: [Pkm] = []
        pokeMonTypeArr.forEach { value in
        guard let slot = value["slot"] as? Int else { return }
        guard let pogoDict = value["pokemon"] as? [String: Any] else { return }
        guard let pokeMonTypeLink = self.createNameLink(dict: pogoDict) else { return }
        pokeMonTypes.append(Pkm(slot: slot, pokeMon: pokeMonTypeLink))
        }
        
        // ---------     Generation       ---------
        guard let generationDict = base["generation"] as? [String: Any] else { return nil }
        guard let generation = createNameLink(dict: generationDict) else { return nil }

       
        // ---------     Return type Pokemon       ---------
        //has to be in specific way
        return Pokemon(damage_relations: damageRelations, game_indices: finalGameIndices, generation: generation, id: id, move_damage_class: move_damage_class, moves: finalMoves, name: name1, pokemon: pokeMonTypes)

    } // of parsePokemonManually
    
    private func createNameLink(dict: [String: Any]) -> NameLink? {
        guard let name = dict["name"] as? String else { return nil }
        guard let url = dict["url"] as? String else { return nil }
        return NameLink(name: name, url: url)
    } // end of createNameLink
} // end of NetworkManager
