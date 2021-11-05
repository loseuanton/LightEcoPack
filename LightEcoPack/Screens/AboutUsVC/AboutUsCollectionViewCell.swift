//
//  AboutUsCollectionViewCell.swift
//  LightEcoPack
//
//  Created by Admin on 11.10.21.
//

import UIKit

class AboutUsCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet private weak var imageAboutUs: UIImageView!
    @IBOutlet private weak var descriptionAboutUs: UITextView!
    
    
    
    func setup(aboutUs: AboutUs) {
        
        imageAboutUs.loadImage(by: aboutUs.imageAboutUs, completion: {})
        descriptionAboutUs.text = aboutUs.descriptionAboutUs
        descriptionAboutUs.backgroundColor = UIColor(red: 217.0 / 255.0, green: 201.0 / 255.0, blue: 202.0 / 255.0, alpha: 1)
    }
    
}
