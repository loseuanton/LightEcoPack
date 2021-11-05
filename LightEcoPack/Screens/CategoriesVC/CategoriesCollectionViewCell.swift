//
//  CategoriesCollectionViewCell.swift
//  LightEcoPack
//
//  Created by Admin on 8.10.21.
//

import UIKit
import Firebase
import FirebaseDatabase

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    
    func setup(with category: Category) {
        
    
        nameLabel.text = category.name
        imageView.loadImage(by: category.image, completion: {})
        nameLabel.textColor = UIColor(red: 91.0 / 255.0, green: 64.0 / 255.0, blue: 48.0 / 255.0, alpha: 1)
        imageView.layer.cornerRadius = imageView.frame.height / 20.0
        contentView.layer.cornerRadius = 15.0
        contentView.clipsToBounds = true
       
}
    
}
