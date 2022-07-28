//
//  FavoriteVC.swift
//  tab_bar_practice
//
//  Created by Consultant on 7/22/22.
//

import UIKit


protocol CellDelegate: AnyObject{
    func onCellModelChange(cell: AlbumTableViewCell, model: FavoriteButtonIdentity)
    
    
}


    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//         guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? Cell else {
//             return UITableViewCell()
//         }
//
//         let model = elements[indexPath.row]
//         cell.update(with: model)
//         cell.delegate = self
//
//         return cell
//     }
    



class AlbumTableViewCell: UITableViewCell{

    static let reuseId = "\(AlbumTableViewCell.self)"
    
    weak var delegate: CellDelegate?

    lazy var itunesImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        // imageView.backgroundColor = .white
       // imageView.layer.cornerRadius = 12
        
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true

        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
//        imageView.image = UIImage(named: "screenshotImg")
        return imageView
    }()



    lazy var itunesTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.layer.cornerRadius = 5
        // mask to bounds
        // hugging priority
        // content compression resistance
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.backgroundColor = .lightGray
        label.text = "Title"

        return label
    }()


    lazy var itunesAuthor: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.backgroundColor = .lightGray

        label.text = "Author: "

        return label
    }()


    lazy var favoriteButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        
        
        button.addTarget(self, action: #selector(self.favoriteButtonPressed), for: .touchUpInside)
        button.setImage(UIImage(systemName: "heart"), for: UIControl.State.normal)
        return button
    }()
    
    

    override func awakeFromNib() {
        super.awakeFromNib() // initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI()
    }
//
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.setUpUI()
    }
    
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    
  
    
    

    private func setUpUI(){
        
//
        let hStack = UIStackView(axis: .horizontal, spacing: 8, distribution: .fill)
        let vStackRight = UIStackView(axis: .vertical, spacing: 8, distribution: .fill)
        let vStackLeft = UIStackView(axis: .vertical, spacing: 8, distribution: .fill)
        
        
               let rightBufferTop = UIView.createBufferView()
               let rightBufferBottom = UIView.createBufferView()
               
               vStackRight.addArrangedSubview(rightBufferTop)
               vStackRight.addArrangedSubview(self.itunesTitle)
               vStackRight.addArrangedSubview(self.itunesAuthor)
             vStackRight.addArrangedSubview(self.favoriteButton)
               vStackRight.addArrangedSubview(rightBufferBottom)
               
               rightBufferTop.heightAnchor.constraint(equalTo: rightBufferBottom.heightAnchor).isActive = true
               
               let leftBufferTop = UIView.createBufferView()
               let leftBufferBottom = UIView.createBufferView()
               
               vStackLeft.addArrangedSubview(leftBufferTop)
               vStackLeft.addArrangedSubview(self.itunesImage) // puts the image on the left
               vStackLeft.addArrangedSubview(leftBufferBottom)
               
               leftBufferTop.heightAnchor.constraint(equalTo: leftBufferBottom.heightAnchor).isActive = true
               
               hStack.addArrangedSubview(vStackLeft)
               hStack.addArrangedSubview(vStackRight)
               
               self.contentView.addSubview(hStack)
               
               hStack.bindToSuperView()

}// end of setUpUI()
    
    @IBAction func FavoriteBtnPressed(_ sender: FavoriteVC) {
        delegate?.onCellModelChange(cell: self, model: .FavoriteBtn)

    }
    
    func update(with model: FavoriteButtonIdentity){
//        favoriteButton.backgroundColor = .lightGray // probably change this later
//        favoriteButtonPressed.backgroundColor = .lightGray
       
       
        
        switch model {
        case .FavoriteBtn:
            
            favoriteButton.backgroundColor = .systemGray
        n = 0
        case .FavoriteBtnPressed:
            favoriteButton.backgroundColor = .systemBlue
            n = 1
         //   self.favoriteButtonPressed.backgroundColor = .systemBlue

        
            
        }// end of switch cases
        
        
       

    }
   
    func configure(musicVM: AlbumViewModelTypes, index: Int){
        
       // self.favoriteButton.text = musicVM.
        self.itunesTitle.text = musicVM.albumTitle(for: index)//
        self.itunesAuthor.text = musicVM.albumArtist(for: index)
        musicVM.albumImage(for: index) { imageData in // minute 30  -- calls in images
            guard let imageData = imageData else {
                return
            }
 
            
            DispatchQueue.main.async {
                self.itunesImage.image = UIImage(data: imageData)
            }
        } // 30 mins into MVVM_cont video
        // still need to call the image view
        
    }
    var n = 0
        @objc
        func favoriteButtonPressed(){
            if n == 0 {
                self.favoriteButton.backgroundColor = .blue
                n = 1
            }
            else {
                self.favoriteButton.backgroundColor = .gray
                n = 0
            }
            //  let value = favoriteButton.
            // self.userDefaults(value: value)
            }
//     if let display = UserDefaults.standard.object(forKey: "Display") as? Double {

}

