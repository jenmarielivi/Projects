//
//  MusicViewModel.swift
//  tab_bar_practice
//
//  Created by Consultant on 7/24/22.
//

import Foundation

protocol AlbumViewModelCore {
//    var networkManager: NetworkService { get }
    func bind(updateHandler: @escaping () -> Void) // binding function

    func getAlbums()    // need to be able to request to get the moview
    func albumTitle(for index: Int) -> String? // 16: 10
    func albumArtist(for index: Int) -> String?
    func albumGenre()
    func albumRelease()

}

protocol AlbumViewModelAttributes {
    var count: Int { get }
    
    func albumTitle(for index: Int) -> String?
    
    func albumImage(for index: Int, completion: @escaping (Data?) -> Void)
}



// protocol

typealias AlbumViewModelTypes = AlbumViewModelCore & AlbumViewModelAttributes

class AlbumViewModel {
    // private var albums: [Album] = []
  
    private var albums: [Results] = [] { // is called movies in video example
        didSet { // anytime albums change updateHandler gets fired
            print("Test: 5")
            self.updateHandler?() // optional func
        }
    }
    
    // networkManager: NetworkService piece has to be below the didSet
    private var networkManager: NetworkService
    private var pageCount = 1
    
    private var updateHandler: (() -> Void)?
    
    init(networkManager: NetworkService) {
        self.networkManager = networkManager
    }
}

extension AlbumViewModel: AlbumViewModelCore {
    
    func albumArtist(for index: Int) -> String? {
        guard index < self.count else { return nil}
        return self.albums[index].artistName
    }
    
    func albumGenre() {
        return
    }
    
    func albumRelease() {
        return
    }
    
   
    func bind(updateHandler: @escaping () -> Void) {
        self.updateHandler = updateHandler // this is a separate call from the other one
    }
  
    func getAlbums() {
        
        self.networkManager.getModel(url: NetwokParams.albumMusic.url) { (result: Result<Album, NetworkError>) in
            switch result {
            case .success(let page):
                print("Test: 4") //  let results: [Movie]
                self.albums.append(contentsOf: page.feed.results)
            case .failure(let error):
                print(error)
            }
        }
    }
}

    

extension AlbumViewModel: AlbumViewModelAttributes {
    var count: Int {
        return self.albums.count
    }
    
    func albumTitle(for index: Int) -> String? {
        guard index < self.count else { return nil }
        return self.albums[index].name
    }
    
    func albumImage(for index: Int, completion: @escaping (Data?) -> Void) {
        guard index < self.count else {
            completion(nil)
            return
        }
        
        // setting artworkUrl100 to AlbumImg for simpler calling
        let AlbumImg = self.albums[index].artworkUrl100
        
        // Check ImageCache
        if let imageData = ImageCache.shared.getImageData(key: AlbumImg) {
            completion(imageData)
            return
        }
        
        // else call network
        self.networkManager.getRawData(url: NetwokParams.albumImage(AlbumImg).url) { result in
            switch result {
            case .success(let imageData):
        
            ImageCache.shared.setImageData(data: imageData, key: AlbumImg)
                completion(imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}
    
