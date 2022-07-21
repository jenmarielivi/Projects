//
//  UIViewExtension.swift
//  LivingstonPokemonProject
//
//  Created by Consultant on 7/17/22.
//

import UIKit

extension UIView{ // 1 hr into video
    
    func bindToSuperView(insets: UIEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)){
        
        guard let superSafeArea = self.superview?.safeAreaLayoutGuide else {
            fatalError("Forgot to add the view to the view hierarchy. Go back and add that in!")
        }// end of else
        
        self.topAnchor.constraint(equalTo: superSafeArea.topAnchor, constant: insets.top).isActive = true
        self.leadingAnchor.constraint(equalTo: superSafeArea.leadingAnchor, constant: insets.left).isActive = true
        self.trailingAnchor.constraint(equalTo: superSafeArea.trailingAnchor, constant: -insets.right).isActive = true
        self.bottomAnchor.constraint(equalTo: superSafeArea.bottomAnchor, constant: -insets.bottom).isActive = true
    }// end of bindToSuperView
    
    
    // 2 hrs 8 mins
    // Mark: factory pattern
    // might not need this
    static func createBufferView() -> UIView{
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemRed
        view.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        view.setContentHuggingPriority(UILayoutPriority(1), for: .horizontal)
        
        view.setContentCompressionResistancePriority(UILayoutPriority(1), for: .vertical)
        view.setContentCompressionResistancePriority(UILayoutPriority(1), for: .horizontal)
        
        return view
    }// end of static func
    
}// end of extension UIView
