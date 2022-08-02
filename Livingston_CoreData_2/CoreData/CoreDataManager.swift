////
////  CoreDataManager.swift
////  Livingston_CoreData
////
////  Created by Consultant on 7/26/22.
////
//
import CoreData
import Foundation

class CoreDataManager {
    
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Livingston_CoreData")
        container.loadPersistentStores { _, error in
            if let _ = error {
                fatalError("Something went wrong")
            } // end of if let error
        } // end of container.loadPersistentStores
        return container
    }()

    func saveContext() {
        let context = self.persistentContainer.viewContext
        if context.hasChanges {
           
            do {
                try context.save()
            } catch {
                print(error)
            }
        } // end of hasChanges
    } // end of saveContext
    
    func getAlbums() -> [FavAlbums] {  // get the favorite albums
        var arrFav: [FavAlbums] = [] // setup the array to call these
        let context = self.persistentContainer.viewContext

        let request: NSFetchRequest<FavAlbums> = FavAlbums.fetchRequest()

        do{
            let results = try context.fetch(request)
             print("some results in core data getAlbums")
            return results   // return results
        } catch {
            print(error)
        }

        return arrFav   // otherwise return nil
    }
    
    
    
    
    func addFavAlbum(albumVM: AlbumViewModel, index: Int){
        
        let context = self.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "FavAlbums", in: context) else { return }
        
        let favAlbums = FavAlbums(entity: entity, insertInto: context)
        
        
        
        favAlbums.title =  albumVM.albumTitle(for: index)
        favAlbums.artist = albumVM.albumArtist(for: index)
        
        
        
        albumVM.albumImage(for: index) { imageData in
            guard let imageData = imageData else {
                return
            }
            DispatchQueue.main.async {
                favAlbums.image = imageData  // gets the image data from favorite ablum
            }
        }
        
        self.saveContext()
        print("core data is working here")
    }
    
//    func deleteAlbum(_ fav: FavAlbum){
//        let context = self.persistentContainer.viewContext
//        context.delete(fav)
//        
//        self.saveContext()
//        
//    }// end of deleteAlbum
    
    
} // end of class CoreDataManager
