//
//  NetworkService.swift
//  LightEcoPack
//
//  Created by Admin on 8.10.21.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase
    
    extension UIImageView {
        
        func loadImage(by url: String, completion: @escaping () -> Void) {
            DispatchQueue.global(qos: .userInitiated).async {
                if let imageUrl = URL(string: url),
                   let imageData = try? Data(contentsOf: imageUrl),
                   let image = UIImage(data: imageData) {
                    DispatchQueue.main.async { [weak self] in
                        self?.image = image
                        completion()
                    }
                }
            }
        }
    }
