//
//  ViewController.swift
//  tab_bar_practice
//
//  Created by Consultant on 7/22/22.
//

import UIKit

class DetailScreenController: UIViewController {
    static let reuseId = "\(DetailScreenController.self)"
    
    
    lazy var MusicTable: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        
        table.backgroundColor = .darkGray

        table.layer.cornerRadius = 12
        table.register(AlbumTableViewCell.self, forCellReuseIdentifier: AlbumTableViewCell.reuseId)
        return table
}()
    
    lazy var Image: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        // imageView.backgroundColor = .white
        // imageView.layer.cornerRadius = 12
        
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true

        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.image = UIImage(named: "screenshotImg")
        return imageView
    }()

    lazy var Title: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.layer.cornerRadius = 5
        label.textAlignment = .center
        // mask to bounds
        // hugging priority
        // content compression resistance
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.backgroundColor = .lightGray
        label.text = "Title"

        return label
    }()

    lazy var Author: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.backgroundColor = .lightGray

        label.text = "Author: "

        return label
    }()
  
    lazy var Genre: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.backgroundColor = .lightGray

        label.text = "Genre: "

        return label
    }()
    
    lazy var Date: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.backgroundColor = .lightGray

        label.text = "Release Date: "

        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail Screen"
        view.backgroundColor = .lightGray // changes background color of the detail screen
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "details"
        self.setUpUI()
        // Do any additional setup after loading the view.
    }
    
  
   
    private func setUpUI() {
        
        let hStack = UIStackView(axis: .horizontal, spacing: 8, distribution: .fill)
        let vStackRight = UIStackView(axis: .vertical, spacing: 8, distribution: .fill)
        let vStackLeft = UIStackView(axis: .vertical, spacing: 8, distribution: .fill)
        
        let rightBufferTop = UIView.createBufferView()
        let rightBufferBottom = UIView.createBufferView()
               
        vStackRight.addArrangedSubview(rightBufferTop)
        vStackRight.addArrangedSubview(self.Title)      // **    Title
        vStackRight.addArrangedSubview(self.Author)     // **    Author
        vStackRight.addArrangedSubview(self.Genre)      // **    Genre
        vStackRight.addArrangedSubview(self.Date)       // **    Date
        vStackRight.addArrangedSubview(rightBufferBottom)
               
        rightBufferTop.heightAnchor.constraint(equalTo: rightBufferBottom.heightAnchor).isActive = true
               
        let leftBufferTop = UIView.createBufferView()
        let leftBufferBottom = UIView.createBufferView()
               
        vStackLeft.addArrangedSubview(leftBufferTop)
        vStackLeft.addArrangedSubview(self.Image)
        vStackLeft.addArrangedSubview(leftBufferBottom)
               
        leftBufferTop.heightAnchor.constraint(equalTo: leftBufferBottom.heightAnchor).isActive = true
               
        hStack.addArrangedSubview(vStackLeft)
        hStack.addArrangedSubview(vStackRight)
               
        //  self.contentView.addSubview(hStack)
        self.view.addSubview(hStack)
               
        hStack.bindToSuperView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib() // initialization code
    }
    
    
    
    func configure(musicVM: AlbumViewModelTypes, index: Int) {
        self.Title.text = musicVM.albumTitle(for: index)
        self.Author.text = musicVM.albumArtist(for: index)
        self.Genre.text = musicVM.albumGenre(for: index)
       
        
        
        musicVM.albumImage(for: index) { imageData in // minute 30  -- calls in images
            guard let imageData = imageData else {
                return
            }
 
            DispatchQueue.main.async {
                self.Image.image = UIImage(data: imageData)
            }
        } // 30 mins into MVVM_cont video
        // still need to call the image view

        // add in date section
        
        // music release date
        // album genre
    }
    
    
    
//    func configureFavPage(musicVM: FavoritesTableViewController, index: Int) {
//        self.Title.text = musicVM.albumTitle(for: index)
//        self.Author.text = musicVM.albumArtist(for: index)
//        self.Genre.text = musicVM.albumGenre(for: index)
//
//
//
//        musicVM.albumImage(for: index) { imageData in // minute 30  -- calls in images
//            guard let imageData = imageData else {
//                return
//            }
//
//            DispatchQueue.main.async {
//                self.Image.image = UIImage(data: imageData)
//            }
//        } // 30 mins into MVVM_cont video
//        // still need to call the image view
//
//        // add in date section
//
//        // music release date
//        // album genre
//    }// end of secondfunc for favoritespage
//
    
}// end of detailScreenController
