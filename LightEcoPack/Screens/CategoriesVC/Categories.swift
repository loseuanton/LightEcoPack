//
//  Categories.swift
//  LightEcoPack
//
//  Created by Admin on 8.10.21.
//

import UIKit
import Firebase
import FirebaseDatabase


struct Product: Codable {
    var name: String
    var madeIn: String
    var image: String
    var size: String
    var capacity: String
    var views: String
    var appointment: String
    
    init?(dict: [String: Any]) {
        guard let name = dict["name"] as? String else { return nil }
        self.name = name
        
        guard let image = dict["image"] as? String else { return nil }
        self.image = image
        
        guard let madeIn = dict["madeIn"] as? String else { return nil }
        self.madeIn = madeIn
        
        guard let size = dict["size"] as? String else { return nil }
        self.size = size
        
        guard let capacity = dict["capacity"] as? String else { return nil }
        self.capacity = capacity
        
        guard let views = dict["views"] as? String else { return nil }
        self.views = views
        
        guard let appointment = dict["appointment"] as? String else { return nil }
        self.appointment = appointment
        }
        }



struct Category: Codable {
    var name: String
    var image: String
    var products: [Product]
    
    init?(dict: [String: Any]) {
        guard let name = dict["name"] as? String else { return nil }
        self.name = name
        
        guard let image = dict["image"] as? String else { return nil }
        self.image = image
        
        guard let productsInfo = dict["products"] as? [[String: Any]] else { return nil }
        self.products = productsInfo.compactMap({ Product(dict: $0) })
    }
}
