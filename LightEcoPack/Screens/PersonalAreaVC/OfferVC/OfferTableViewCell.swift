//
//  OfferTableViewCell.swift
//  LightEcoPack
//
//  Created by Admin on 11.10.21.
//

import UIKit

class OfferTableViewCell: UITableViewCell {

    static let rowHeight: CGFloat = 100
    
    @IBOutlet private weak var offerLabel: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup(offer: Offer) {
        offerLabel.text = offer.offer
    }

}
