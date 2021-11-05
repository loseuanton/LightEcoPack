//
//  ProductInfoVC.swift
//  LightEcoPack
//
//  Created by Admin on 8.10.21.
//

import UIKit
import Firebase

class ProductInfoVC: UIViewController {

    
    var product: Product!
    
    @IBOutlet private weak var photoImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var madeInLabel: UILabel!
    @IBOutlet private weak var sizeLabel: UILabel!
    @IBOutlet private weak var capacityLabel: UILabel!
    @IBOutlet private weak var viewsLabel: UILabel!
    @IBOutlet private weak var appointmentLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    func setup() {
        photoImageView.loadImage(by: product.image , completion: {})
        nameLabel.text = product.name
        madeInLabel.text = product.madeIn
        sizeLabel.text = product.size
        capacityLabel.text = product.capacity
        viewsLabel.text = product.views
        appointmentLabel.text = product.appointment
        view.backgroundColor = UIColor(red: 217.0 / 255.0, green: 201.0 / 255.0, blue: 202.0 / 255.0, alpha: 1)
    }

   
}

