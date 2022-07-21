//
//  PokemonTableViewCell.swift
//  LivingstonPokemonProject
//
//  Created by Consultant on 7/17/22.
//

import UIKit
class PokemonTableViewCell: UITableViewCell {
   
    static let reuseID = "\(PokemonTableViewCell.self)" // let network = PokemonService()
    var pokemons: Pokemon?
    
    // --------    Pokemon Image   --------
    lazy var PokemonImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemGray
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        imageView.layer.cornerRadius = 15.0
        return imageView
        
    }()
    
    // --------    Title Label     --------
    lazy var Pokemanname: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.setContentHuggingPriority(.required, for: .vertical) // 1 hr 21 min
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        
        label.numberOfLines = 0
        label.contentMode = .scaleAspectFit
        label.backgroundColor = .systemGray
        //label.text = "Pokemon Title"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        
        //label.font = UIFont.systemFont(ofSize: 20.0)
       
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        label.widthAnchor.constraint(equalToConstant: 20).isActive = true
        label.layer.cornerRadius = 15.0
        return label
    }()
    
    // --------    OverView Label   --------
    lazy var PokeType: UILabel = { // 47:30
        let overview = UILabel(frame: .zero)
        overview.translatesAutoresizingMaskIntoConstraints = false
        overview.numberOfLines = 0
        // overview.lineBreakMode ---- 2hr 26 mins
        overview.text = "Pokemon Desription"
        overview.backgroundColor = .systemBlue
        overview.textAlignment = .center
        overview.layer.cornerRadius = 15.0
        return overview
        
    }()
    
    
//    lazy var PokeMove: UILabel = { // 47:30
//        let overview = UILabel(frame: .zero)
//        overview.translatesAutoresizingMaskIntoConstraints = false
//        overview.numberOfLines = 0
//        // overview.lineBreakMode ---- 2hr 26 mins
//        overview.text = "Pokemon Desription"
//        overview.backgroundColor = .systemBlue
//
//        overview.layer.cornerRadius = 15.0
//        return overview
//
//    }()
    
    // ---------
    
    var indexKeying: [IndexPath: String] = [:]
    let network: NetworkManager = .init()
    
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)

        self.setUpUI()
    }

    private func setUpUI() {
        
        let stackview = UIStackView(frame: .zero)
        stackview.spacing = 4
        let hstack = UIStackView(axis: .horizontal, spacing: 8, distribution: .fill)
        
        
        let vstack = UIStackView(axis: .vertical, spacing: 8, distribution: .fill)
        
        
        vstack.addArrangedSubview(self.Pokemanname)
        vstack.addArrangedSubview(self.PokeType)
        hstack.addArrangedSubview(self.PokemonImage)
        
        hstack.addArrangedSubview(vstack)
        
        
        
       // hstack.addArrangedSubview(vstack)
        
        //hstack.addArrangedSubview(v2stack)
        
        
        self.contentView.addSubview(hstack)
        hstack.bindToSuperView()
    }
    
    func configure(names: ResultName) {
        self.Pokemanname.text = names.name.capitalized
//        self.PokeMove.text = move.move.name
//        self.Pokemon.text = id.id
        
    }
    
    func configure(types: LiteralType) {
        self.PokeType.text = types.type.name
    }

    }
