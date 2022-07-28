////
////  CoreDataManager.swift
////  Livingston_CoreData
////
////  Created by Consultant on 7/26/22.
////
//
//import Foundation
//import CoreData
//
//
//class CoreDataManager{
//
//    // MARK: stack
//
//
//    lazy var persistentContainer: NSPersistentContainer = { // 1hr 21min of coredata video
//
//        let container = NSPersistentContainer(name: "Livingston_CoreData")
//        container.loadPersistentStores { description, error in
//            if let _ = error{
//                fatalError("Something went wrong")
//            } // end of if let error
//        } // end of container.loadPersistentStores
//
//    }()
//
//
//    func saveContext(){
//        let context = self.persistentContainer.viewContext
//        if context.hasChanges {
//
//            do{
//                try context.save()
//            } catch {
//                print(error)
//            } // end of catch
//        } //end of hasChanges
//
//
//    } //end of saveContext
//
//

//
//} // end of class CoreDataManager
