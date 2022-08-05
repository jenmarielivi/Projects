//
//  UIViewExtensions.swift
//  MessageApp3
//
//  Created by Consultant on 8/5/22.
//

import UIKit

extension UIView{
    func bindToSuperview(insets: CGFloat = 8){
        
        guard let superSafeArea = self.superview?.safeAreaLayoutGuide else {
            fatalError("Hey, you forgot to add the view to the view hiearchy")
        }
        
        self.topAnchor.constraint(equalTo: superSafeArea.topAnchor, constant: 8).isActive = true
        self.leadingAnchor.constraint(equalTo: superSafeArea.leadingAnchor, constant:  8).isActive = true
        self.trailingAnchor.constraint(equalTo: superSafeArea.trailingAnchor, constant: -8).isActive = true
        self.bottomAnchor.constraint(equalTo: superSafeArea.bottomAnchor, constant: -8).isActive = true
        
    }
}
