
//
//  ViewController.swift
//  tab_bar_practice
//
//  Created by Consultant on 7/22/22.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let musicVM: AlbumViewModelTypes

    init(vm: AlbumViewModelTypes) {
        self.musicVM = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTabBar()
    
    } // end of override
    

    func setUpTabBar() {
        tabBar.tintColor = .black // sets color of the diff. nav controllers
        // tabBar.isTranslucent = false
        let lightGray = UIColor.white

        self.tabBar.backgroundColor = UIColor.withAlphaComponent(lightGray)(0.6)
        // table.backgroundColor = UIColor.withAlphaComponent(lightGray)(0.3)

        let homeVC = UINavigationController(rootViewController:
            HomeVC(vm: AlbumViewModel(networkManager: NetworkManager())))
        let favVC = UINavigationController(rootViewController: FavoriteVC(vm: AlbumViewModel(networkManager: NetworkManager())))
        
        homeVC.title = "Home"
        favVC.title = "Favorites"
           
        self.setViewControllers([homeVC, favVC], animated: false)

        guard let items = self.tabBar.items else { return }
        let images = ["house", "star"]
        for x in 0 ..< items.count {
            items[x].image = UIImage(systemName: images[x])
        }
    } // end of setUpTabBar
    
}


/*  ----------
                        
                    HomeVC


                                ---------- */
class HomeVC: UIViewController {
    
    static let reuseId = "\(HomeVC.self)"
    
    
    
    lazy var MusicTable: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        
        table.dataSource = self
        table.delegate = self
        //table.backgroundColor = .white
        
        let lightGray = UIColor.white
        table.backgroundColor = UIColor.withAlphaComponent(lightGray)(0.6)
        table.layer.cornerRadius = 12
        table.register(AlbumTableViewCell.self, forCellReuseIdentifier: AlbumTableViewCell.reuseId)
        return table
}()
    
    
    
    let musicVM: AlbumViewModelTypes

    init(vm: AlbumViewModelTypes) {
        self.musicVM = vm
        super.init(nibName: nil, bundle: nil)
        self.musicVM.bind {
            DispatchQueue.main.async {
                self.MusicTable.reloadData()
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = .darkGray
        self.setUpTableSection()
        title = "Home"
       
        self.musicVM.getAlbums()
        for i in 0..<100 {  // put inside viewDidLoad
            elements.append(FavoriteButtonIdentity.FavoriteBtn)
        }
        
    } // end of override
    
func setUpTableSection() {
        
        self.view.addSubview(self.MusicTable)
      //self.view.addSubview(self.itunesImage)
        self.MusicTable.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        self.MusicTable.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 12).isActive = true
        self.MusicTable.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -12).isActive = true
        self.MusicTable.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -12).isActive = true
    }
    var elements: [FavoriteButtonIdentity] = []
}

extension HomeVC: UITableViewDataSource {
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return self.musicVM.results.count
        return self.musicVM.count
        // return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // return UITableViewCell()
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.reuseId, for: indexPath) as? AlbumTableViewCell else {
            return UITableViewCell()
        }
         let model = elements[indexPath.row]
         cell.update(with: model)
         cell.delegate = self
         cell.configure(musicVM: self.musicVM, index: indexPath.row) // 18 mins
         
        
        return cell
    }
    
   
} // end of datasource

extension HomeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = DetailScreenController()

        detailView.configure(musicVM: self.musicVM, index: indexPath.row)
        
        self.navigationController?.pushViewController(detailView, animated: true)
    }
}
extension HomeVC: CellDelegate{
    func onCellModelChange(cell: AlbumTableViewCell, model: FavoriteButtonIdentity){
        guard let indexPath = MusicTable.indexPath(for: cell) else {
            return }
        
        print(indexPath)
             let index = indexPath.row
             self.elements[index] = model
             DispatchQueue.main.async {
                 self.MusicTable.reloadData()
             }
        }
    
}

enum FavoriteButtonIdentity{
    case FavoriteBtn
    case FavoriteBtnPressed
}


/*  ----------
                        
                    FavoritesVC

                                       ---------- */

class FavoriteVC: UIViewController {
    
    static let reuseId = "\(FavoriteVC.self)"
    
    lazy var MusicTable: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        
//        table.dataSource = self
//        table.delegate = self
        table.backgroundColor = .darkGray
        
//        let lightGray = UIColor.white
//        table.backgroundColor = UIColor.withAlphaComponent(lightGray)(0.6)
        table.layer.cornerRadius = 12
        table.register(AlbumTableViewCell.self, forCellReuseIdentifier: AlbumTableViewCell.reuseId)
        return table

    }()
    
    
    

    @objc
    func favoriteButtonPressed(sender: Any){
//        self.AlbumViewModel.FavoriteBtn()
//        FavoriteBtn.isSelected = true; do {
//            self.FavoriteBtnPressed.backgroundColor = UIColor.red
    }
    
    
    
    
    
    let musicVM: AlbumViewModelTypes

    init(vm: AlbumViewModelTypes) {
        self.musicVM = vm
        super.init(nibName: nil, bundle: nil)
        self.musicVM.bind {
            DispatchQueue.main.async {
                self.MusicTable.reloadData()
                // adjust this so that it doesn't just reload the main view model
            }
        }
    }
    
//    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray // changes background color of the favorites screen

        title = "Favorites" // adds favs underneath image
        self.setUpUI()
        self.musicVM.getAlbums()
    }
    
    
    
    
private func setUpUI() {
    
    self.view.addSubview(self.MusicTable)
    self.MusicTable.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
    self.MusicTable.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
    self.MusicTable.trailingAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
    self.MusicTable.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
    }
    
}


