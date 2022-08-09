//
//  ACViewModel.swift
//  AnimalCrossing_API
//
//  Created by Consultant on 8/8/22.
//

import UIKit


@objcMembers
class ACViewModel: NSObject {
    
    private let networkManager: NetworkManager
    private var films: [AC_Model] = [] {
        
        didSet{
            self.updateHandler?()
        }
    }
    
    private var updateHandler: (() -> Void)?
    
    @objc
    init(networkManager: NetworkManager = NetworkManager.sharedInstance()) {
        self.networkManager = networkManager
    }
    
    
    @objc
    func bind(updateHandler: @escaping () -> Void) {
        self.updateHandler = updateHandler
    }
    
    
    
    @objc
    func fetchACPage(){
 
        self.networkManager.fetchAnimals(1) { [weak self] (films: [Any]) in
            // unowned -> let
            // weak -> var
           
            guard let iFilms = films as? [AC_Model] else { return }  // *** figure out this as well. 
            self?.films = iFilms
            print(films)
//            guard let films = FilmResults?.Ghiblifilms as? [Ghibli_Films] else { return }
//            self?.Ghiblifilms.append(contentsOf: films)
        }
    }
    
    
    var count: Int {
        return self.films.count
    }
    
//
//    func title(for index: Int) -> String? {
//        guard index < self.films.count else { return nil }
//        return self.films[index].title
//    }
//
    func Name(for index: Int) -> String? {
        guard index < self.films.count else { return nil }
        return self.films[index].name
    }
    
    func catchPhrase(for index: Int) -> String? {
        guard index < self.films.count else { return nil }
        return self.films[index].catchPhrase
    }
    
    func identifier(for index: Int) -> String? {
        guard index < self.films.count else { return nil }
        return self.films[index].identifier
    }
    
    func ACImage(for index: Int, completion: @escaping (UIImage?) -> Void) {
        guard index < self.films.count else {
            completion(nil)
            return
        }

        self.networkManager.fetchImage(self.films[index].acImage) { (image: UIImage?) in
            completion(image)
        }
    }
    
    // add in identifier
    
    // add in catchPhrase
    
}
