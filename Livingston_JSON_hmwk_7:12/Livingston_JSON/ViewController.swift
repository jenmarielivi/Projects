//
//  ViewController.swift
//  Livingston_JSON
//
//  Created by Consultant on 7/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    //to do list: add in network
    let network = NetworkManager()
    
    
    lazy var manualDecodeButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Manually Decode Data", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(self.manualDecodeButtonPressed), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return button

    }() // end of manualDecodeButton

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.manualDecodeButton)

        self.manualDecodeButton.centerYAnchor.constraint(equalTo:
            self.view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        self.manualDecodeButton.centerXAnchor.constraint(equalTo:
            self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.manualDecodeButton.leadingAnchor.constraint(equalTo:
            self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        // leadinAnchor gives the button more breathing space
    }

    
    
    @objc
    func manualDecodeButtonPressed() {
        
        let pokemon = self.network.getPokemonManually()
        self.presentPokemonAlert(pokemon: pokemon)
    } // needs to be inside ViewController function
    
    
    func presentPokemonAlert(pokemon: Pokemon?) {
        guard let pokemon = pokemon else { return }
        
        let pokemonResult = pokemon.pokemon.compactMap{ $0.pokeMon.name }.reduce("") { partialResult, pokemon1 in
            return partialResult + pokemon1 + "\n"
        }
        
        let alert = UIAlertController(title: pokemon.name, message: pokemonResult, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Sounds Good", style: .default, handler: nil)
        alert.addAction(action)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
        
    }

} // end of class View Controller
