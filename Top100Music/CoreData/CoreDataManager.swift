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
        let container = NSPersistentContainer(name: "Top100Music")
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
    
    
    
    func getFavAlbums() -> [FavAlbums] { // get the favorite albums
        let arrFav: [FavAlbums] = [] // setup the array to call these
        let context = self.persistentContainer.viewContext

        let request: NSFetchRequest<FavAlbums> = FavAlbums.fetchRequest()

        do {
            let arrFav = try context.fetch(request)
            for n in arrFav{
                if let namesT = n.albumname{
                    print(n)
                    print(namesT)
                   
                }
                return arrFav
            }
        } catch {
            print("Unable to fetch coredata")
        }

        return [] // otherwise return nil
    }
    
    func fetchfavorite() -> FavAlbums? {
        let context = self.persistentContainer.viewContext
        
        let request: NSFetchRequest<FavAlbums> = FavAlbums.fetchRequest()
        
        do {
            let results = try context.fetch(request)

            if let Fav = results.first {
                
         
                return Fav
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    

    func Alb(Alname: String, Arname:String, AlImage: String, Gen: String, ReDate: String, id1: Int ) -> FavAlbums?{
        let context = self.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "FavAlbums", in: context) else { return nil }
        
        let album = FavAlbums(entity: entity, insertInto: context)
        
        album.albumname = Alname
        album.artistname = Arname
        album.genres = Gen
        album.picture = AlImage
        album.releaseDate = ReDate
        album.ids = Int16(id1)
    
        return album
        
        
    }
    
    func deleteAllData(_ entity:String) {
        let context = self.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                context.delete(objectData)
                
            }
        } catch let error {
            print("Detele all data in \(entity) error :", error)
        }
        self.saveContext()
    }
    
    
    
    func removeAlbum(_ fav: FavAlbums) { // be able to remove the favorites from the favorite album
        let context = self.persistentContainer.viewContext
        context.delete(fav)
        self.saveContext() // save new state of the recently unfavorited album
    }
    
} // end of class CoreDataManager
