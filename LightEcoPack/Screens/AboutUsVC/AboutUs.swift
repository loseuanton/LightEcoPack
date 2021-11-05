//
//  AboutUs.swift
//  LightEcoPack
//
//  Created by Admin on 11.10.21.
//
import UIKit
import Foundation
import Firebase

struct AboutUs: Codable {
    var imageAboutUs: String
    var descriptionAboutUs: String
    
    init?(dict: [String: Any]) {
        guard let descriptionAboutUs = dict["descriptionAboutUs"] as? String else { return nil }
        self.descriptionAboutUs = descriptionAboutUs
        
        guard let imageAboutUs = dict["imageAboutUs"] as? String else { return nil }
        self.imageAboutUs = imageAboutUs
        
    }
}
