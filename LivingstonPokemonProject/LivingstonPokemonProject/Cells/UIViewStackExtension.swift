//
//  UIViewStackExtension.swift
//  LivingstonPokemonProject
//
//  Created by Consultant on 7/17/22.
//

import UIKit


//init?(num: Int){
//    guard num > 5 else {return nil}
//} may only be declared within a type

extension UIStackView{
    
    
    
    
    convenience init(axis: NSLayoutConstraint.Axis, spacing: CGFloat, distribution: Distribution){
        
        self.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
    }
    
}
