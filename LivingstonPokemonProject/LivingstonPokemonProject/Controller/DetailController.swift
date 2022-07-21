import UIKit

class DetailController: UIViewController{
    
      var pokemons: [Pokemon] = []
//    var pokemons: Int?
//    var PokeNames: Pokemon?
      var Sprites: UIImage?
//    var PokeType: LiteralType?
//    var PokeAbility: Ability?
//    var PokeMoves: [Move?]
 
    
    
    var imageURL: String?
    func configure(with pokemon: Pokemon){
           // self.pokemons = pokemon
        self.pokemons.append(pokemon)
    }
    
    
    lazy var Table: UITableView = {
        let Table = UITableView(frame: .zero)
        Table.translatesAutoresizingMaskIntoConstraints = false
        Table.backgroundColor = .darkGray
        return Table
    }()
    
    
    // -------    Name    -------
    lazy var PokemonName: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.backgroundColor = .white
 //       label.text = poketype?.type.name ?? "MISSINGNO"
        label.text = "hola Chuy"
        return label    }()
    
    
    // -------    Type   -------
    lazy var PokemonType: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.backgroundColor = .systemPurple
        label.text = "hola Jenn"
        return label
    }()
    
    // -------    Sprite   -------
        lazy var Sprite: UIImageView = {
            let imageView = UIImageView(frame: .zero)
            //imageView.image = UIImage()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            imageView.backgroundColor = .white
            return imageView
    
        }()
    
    // -------    Abilities   -------
        // make it a button so that they all show up
        lazy var Abilities: UILabel = {
            let label = UILabel(frame: .zero)
            label.translatesAutoresizingMaskIntoConstraints = false
           // abilityButton.setTitle("Abilities", for: .normal)
            label.text = "Abilities:" + "\n"
            label.backgroundColor = .systemGray
            label.layer.cornerRadius = 8.0
          //  abilityButton.addTarget(self, action: #selector(self.abilitiesPressed), for: .touchUpInside)
    
            return label
        }()
    
    
    // -------    Moves   -------
        // make it a scroll view so that they all show up
        lazy var Moves: UILabel = {
            let label = UILabel(frame: .zero)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.layer.cornerRadius = 8.0
            label.text = "Moves:" + "\n"
           // movesButton.addTarget(self, action: #selector(self.movesButtonPressed), for: .touchUpInside)
            return label
    
        }()
    
    
    override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemOrange
        self.view.addSubview(self.Table)
        self.setUpUI()
    }
    
    
//    required init?(coder: NSCoder) {
//          fatalError("init(coder:) has not been implemented")
//      }
  
  ////        Sprite.image = UIImage.gifImageWithURL("url")
  //
  //
  ////        self.view.addSubview(self.PokeImage)
  ////        self.PokeImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
  ////        self.PokeImage.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
  ////        self.PokeImage.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
  ////        self.PokeImage.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
  //
  //
  //    }
    
    
    
    private func setUpUI(){
        self.view.addSubview(self.PokemonName)
        self.view.addSubview(self.PokemonType)
        self.view.addSubview(self.Sprite)
        
        
        
        
        self.Sprite.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.Sprite.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.Sprite.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.Sprite.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    
        
    }
    
   


//    private func setUpUI(){
//        /*
//         PokemonName
//         PokemonType
//         Sprite
//         Abilities
//         Moves
//         */
//
//        //self.view.addSubview(self.Sprite)
//
//        self.view.addSubview(self.PokemonName)
//        self.view.addSubview(self.PokemonType)
//            //self.view.addSubview(self.Sprites)
//        self.view.addSubview(self.Abilities)
//        self.view.addSubview(self.Moves)
//    }
//}
        //guard let pic = ImageCache.shared.getImageData(key: "\(pokemons ?? 0)") else{return}
        //self.Sprites.image = UIImage(data: data)
        
//
//        //   --------------     PokemonName      --------------
//          self.PokemonName.leadingAnchor.constraint(equalTo: self.Sprites.trailingAnchor, constant: 8).isActive = true
//          self.PokemonName.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
//          self.PokemonName.heightAnchor.constraint(equalToConstant:10).isActive = true
//          self.PokemonName.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
//
//
//
//       //    --------------     PokemonType      --------------
//
//          self.PokemonType.leadingAnchor.constraint(equalTo: self.Sprites.trailingAnchor, constant: 8).isActive = true
//          self.PokemonType.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,
//      constant: -8).isActive = true
//          self.PokemonType.heightAnchor.constraint(equalToConstant: 10).isActive = true
//  //        self.PokemonType.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 54).isActive = true
//          self.PokemonType.topAnchor.constraint(equalTo: self.PokemonName.bottomAnchor, constant: 8).isActive = true
//
//
//
//         //  --------------       Sprite         --------------
//          self.Sprites.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
//          self.Sprites.widthAnchor.constraint(equalToConstant: 150).isActive = true
//          self.Sprites.heightAnchor.constraint(equalToConstant: 150).isActive = true
//          self.Sprites.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
//
//
//           //--------------      Abilities       --------------
//          self.Abilities.leadingAnchor.constraint(equalTo: self.Sprites.trailingAnchor, constant: 8).isActive = true
//          self.Abilities.trailingAnchor.constraint(equalTo: self.Sprites.trailingAnchor, constant: -8).isActive = true
//          self.Abilities.heightAnchor.constraint(equalToConstant: 40).isActive = true
//          self.Abilities.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
//
//
//
//         //  --------------        Moves         --------------
//          self.Moves.leadingAnchor.constraint(equalTo: self.Sprites.trailingAnchor, constant: 8).isActive = true
//          self.Moves.trailingAnchor.constraint(equalTo: self.Sprites.trailingAnchor, constant: -8).isActive = true
//          self.Moves.heightAnchor.constraint(equalToConstant: 40).isActive = true
//          self.Moves.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
//
//

}
