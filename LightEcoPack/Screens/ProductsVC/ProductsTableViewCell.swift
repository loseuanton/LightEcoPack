//
//  ProductsTableViewCell.swift
//  LightEcoPack
//
//  Created by Admin on 8.10.21.
//

import UIKit
import Firebase


class ProductsTableViewCell: UITableViewCell {
    
    static let rowHeight: CGFloat = 100
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet  weak var photoImageView: UIImageView!
    
    
    func setup(with products: Product) {
        photoImageView.loadImage(by: products.image, completion: {})
        nameLabel.text = products.name
//        descriptionLabel.text = products.description
        
        layer.cornerRadius = 15.0

}
}

