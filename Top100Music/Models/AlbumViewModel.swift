//
//  MusicViewModel.swift
//  tab_bar_practice
//
//  Created by Consultant on 7/24/22.
//

import Foundation
import CoreData

protocol AlbumViewModelCore {
//    var networkManager: NetworkService { get }
    func bind(updateHandler: @escaping () -> Void) // binding function
    func getAlbums()    // need to be able to request to get the moview
    func findAll() -> [FavAlbums]
    func makeFavAlbum(index: Int)
    func loadAlbum()
    func deleteFav()
    func musicImage(for index: String, completion: @escaping (Data?) -> Void)

}

protocol AlbumViewModelAttributes {
    var count: Int { get }
    // var favAlbums: [FavAlbums]?
    func albumTitle(for index: Int) -> String?
    func albumArtist(for index: Int) -> String?
    func albumRelease(for index: Int) -> String?
    func albumGenre(for index: Int) -> String?
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
    
//    var favAlbums: [FavAlbums] = [] {
//        didSet{
//            self.updateHandler?()
//        }
//    }
    
    // networkManager: NetworkService piece has to be below the didSet
    private var networkManager: NetworkService
    private var updateHandler: (() -> Void)?

    
    var manager: CoreDataManager
//    private var pageCount = 1
    

    init(networkManager: NetworkService, manager: CoreDataManager = CoreDataManager()) {
        self.networkManager = networkManager
        self.manager = manager
    }
}

extension AlbumViewModel: AlbumViewModelCore {
    func findAll() -> [FavAlbums] {
        
        return self.manager.getFavAlbums()
        
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
    }// end of getAlbums
    
    
    func makeFavAlbum(index: Int){  // index: Int. trying to get one favorite at a time
        
        
        self.manager.Alb(Alname: albums[index].name, Arname: albums[index].artistName, AlImage: albums[index].artworkUrl100, Gen: albums[index].genres[0].name, ReDate: albums[index].releaseDate, id1: index)
        self.manager.saveContext()
        // print statement to see what its actually pulling
        print("The current favorite album")
    }
    
    func loadAlbum(){
        self.manager.fetchfavorite() // load
        // print statement to show something happening
        print("loadAlbum is working ")
    }
    
    func deleteFav(){
        self.manager.deleteAllData("FavAlbums")

    }
    func musicImage(for index: String, completion: @escaping (Data?) -> Void) {
        
        

        self.networkManager.getRawData(url: NetwokParams.albumImage(index).url) { result in
            switch result {
            case .success(let imageData):
                //ImageCache.shared.setImageData(data: imageData, key: "\(index)")
                completion(imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
    

    
//    func makeAlbum(index: Int){
//        self.manager.makeAlbum(musicVM: self, index: index)
//    }
//
//
//    func loadAlbum(){
//        favAlbums = self.manager.getAlbums()
//    }
    
    // func deleteAlbum(){   }
    
} // end of ext. AlbumViewModelCore

    

extension AlbumViewModel: AlbumViewModelAttributes {
   
    
    
    var count: Int {
        return self.albums.count
    }
    
    func albumArtist(for index: Int) -> String? {
        guard index < self.count else { return nil}
        return self.albums[index].artistName
    }
    
    
    func albumTitle(for index: Int) -> String? {
        guard index < self.count else { return nil }
        return self.albums[index].name
    }
    
    
    
    func albumRelease(for index: Int)-> String? {
        guard index < self.count else { return nil }
        return self.albums[index].releaseDate
    }
   
    
    func albumGenre(for index: Int) -> String?{
        guard index < self.count else { return nil }
        return self.albums[index].genres[0].name  // this line of code, along with whats in the setup in the detail screen allow it to show
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
    
