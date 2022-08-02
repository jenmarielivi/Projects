////
////  DetailTableViewCell.swift
////  Livingston_CoreData
////
////  Created by Consultant on 7/25/22.
////
//
//import UIKit
//
//class FavoritesTableViewController: UIViewController {
//    
//    lazy var FavTable: UITableView = {
//        let table = UITableView(frame: .zero)
//        table.translatesAutoresizingMaskIntoConstraints = false
//        
//        table.dataSource = self
//        table.delegate = self
//        //table.backgroundColor = .white
//        
//        let lightGray = UIColor.white
//        table.backgroundColor = UIColor.withAlphaComponent(lightGray)(0.6)
//        table.layer.cornerRadius = 12
//        table.register(AlbumTableViewCell.self, forCellReuseIdentifier: AlbumTableViewCell.reuseId)
//        return table
//}()
//    
//    
//    let musicVM = AlbumViewModel (networkManager: NetworkManager())
//    
//     override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemGray6
//        
//         self.setUpUI()
//         
//         
//         self.musicVM.bind {
//             DispatchQueue.main.async{
//                 self.FavTable.reloadData()
//             }
//         }
//         self.musicVM.getAlbums()
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        //self.musicVM.loadAlbum()
//        super.viewWillAppear(animated)
//    }
//    
//    private func setUpUI(){
//        self.title = "Favorites Page"
//        
//        self.view.addSubview(self.FavTable)
//        
//        self.FavTable.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
//        
//        self.FavTable.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
//        
//        
//        self.FavTable.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
//        
//        self.FavTable.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
//        
//        
//        
//        
//    } // end of setUpUI
//    
//    
//}
//
//
//extension FavoritesTableViewController: UITableViewDelegate{
//
//}
//
//
//extension FavoritesTableViewController: UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.musicVM.favAlbums?.count ?? -1
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.reuseId, for: indexPath) as? AlbumTableViewCell else {
//            return UITableViewCell()
//        }
//        
//        guard let fav = musicVM.favAlbums else {return UITableViewCell()}
//        
//        cell.itunesTitle.text = musicVM.favAlbums?[indexPath.row].title
//        cell.itunesAuthor.text = musicVM.favAlbums?[indexPath.row].artist
//
//        
//        guard let img = fav[indexPath.row].artworkUrl100 else { return UITableViewCell()} // the auto fix wanted to include !=
//        self.musicVM.bind{
//            DispatchQueue.main.async {
//                self.FavTable.reloadData()
//            }
//        }
//        return cell
//        
//    }
//    
//    
//}
