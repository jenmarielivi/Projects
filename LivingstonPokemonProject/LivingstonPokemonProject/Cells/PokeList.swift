import Foundation

struct PokeList: Decodable{

    let results: [ResultName]
}

struct ResultName: Decodable{
    let name: String
}
