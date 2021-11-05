//
//  CartTableViewCell.swift
//  LightEcoPack
//
//  Created by Admin on 11.10.21.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    static let rowHeight: CGFloat = 100
    
    @IBOutlet private weak var cartLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setup(cart: Cart) {
        cartLabel.text = cart.cart
    }
}
