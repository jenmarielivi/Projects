//
//  ViewController.swift
//  ProjectPokedexRev2
//
//  Created by Consultant on 7/16/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    lazy var table: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        //table.backgroundColor = .black
        table.dataSource = self
        table.delegate = self
        
        table.register(PokemonTableViewCell.self, forCellReuseIdentifier: PokemonTableViewCell.reuseID)
        return table
    }()
    
    var number: Int = 0
    let network: NetworkManager = .init()
    var pokemon: [ResultName] = []
    var pokeType: [LiteralType] = []
    var pokename: [Pokemon] = []
    var pokeAbility: [Ability] = []
    var pokeMove: [Move] = []
    let types: [LiteralType] = []
    
    var indexKeying: [IndexPath: String] = [:] // min 9:47

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpUI()
        // Add in pagination
        self.network.getPokemon(urlStr: "https://pokeapi.co/api/v2/pokemon?offset=0&limit=30") { result in
            
            switch result {
            case .success(let page):
                self.pokemon = page.results
                DispatchQueue.main.async {
                    self.table.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func setUpUI() {
        self.view.backgroundColor = .white
        self.title = "Pokédex!"
        self.view.addSubview(self.table)
        self.table.bindToSuperView()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokemonTableViewCell.reuseID, for: indexPath) as? PokemonTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(names: self.pokemon[indexPath.row])
        
        self.network.fetchPage(urlStr: "https://pokeapi.co/api/v2/pokemon/\(indexPath.row + 1)") { result in

            switch result {
            case .success(let page):

                //self.pokeAbility = page.abilities
                self.pokeType = page.types
                //self.pokeMove = page.moves
                if let firstType = page.types.first {
                    DispatchQueue.main.async {
                        cell.configure(types: firstType)
                    }
                } else {
                }
            case .failure(let error):
                print(error)
            }
        }
                
        if let imageData = ImageCache.shared.getImageData(key: "\(indexPath.row)") {
                        print("Image found in cache")
                        cell.PokemonImage.image = UIImage(data: imageData)
                    }
                 
        self.network.fetchImageData(urlStr: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(indexPath.row + 1).png") { result in
                    
            switch result {
            case .success(let imageData):
                    
                DispatchQueue.main.async {
                    cell.PokemonImage.image = UIImage(data: imageData)
                }
            case .failure(let error):
                print(error)
            }
        }
        
        return cell
    }
}
        
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        let nc: UIViewController = DetailController()

        self.navigationController?.pushViewController(nc, animated: true)
        let detailVCimage = DetailController()
    }
//        switch result {
//                    case .success(let imageData):
//
//                        self.pokeAbility = page.abilities
//                        self.pokeType = page.types
//                        self.pokeMove = page.moves
//                        if let firstType = page.types.first {
//
//        self.network.fetchImageData(urlStr: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/\(indexPath.row + 1).png") { result in
//
//        switch result{
//        case .success(let imageData):
//            DispatchQueue.main.async {
////                               nc.moves = pokeMove
//                nc.Sprites = UIImage(data: imageData)
//                            }
//        case .failure(let error):
//            print(error)
//
//    }
//}
 //   }
} 


extension ViewController: UITableViewDataSourcePrefetching{
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]){
        let lastIndexPath = IndexPath(row: self.pokemon.count - 1, section: 0)
        guard indexPaths.contains(lastIndexPath) else {return}
        //self.requestPage()
    }
}
