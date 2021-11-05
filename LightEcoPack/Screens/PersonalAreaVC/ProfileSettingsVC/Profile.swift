//
//  Profile.swift
//  LightEcoPack
//
//  Created by Admin on 10.10.21.
//
import UIKit
import Foundation

final class Profile: Codable {
    
    enum CodingKeys: String, CodingKey {
        case logoPhoto = "imageData"
        case nameCompany
        case phoneNumber
        case country
        case email
    }
    var logoPhoto: UIImage?
    var nameCompany: String
    var phoneNumber: String
    var country: String
    var email: String
    
    init(logoPhoto: UIImage?, nameCompany: String?, phoneNumber: String?, country: String?, email: String?) {
        self.logoPhoto = logoPhoto
        self.nameCompany = nameCompany ?? ""
        self.phoneNumber = phoneNumber ?? ""
        self.country = country ?? ""
        self.email = email ?? ""
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(nameCompany, forKey: .nameCompany)
        try container.encode(phoneNumber, forKey: .phoneNumber)
        try container.encode(country, forKey: .country)
        try container.encode(email, forKey: .email)
        
        let imageData = logoPhoto?.jpegData(compressionQuality: 1.0)
        try container.encode(imageData, forKey: .logoPhoto)
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.nameCompany = try container.decode(String.self, forKey: .nameCompany)
        self.phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
        self.country = try container.decode(String.self, forKey: .country)
        self.email = try container.decode(String.self, forKey: .email)
        
        let imageData = try container.decode(Data.self, forKey: .logoPhoto)
        self.logoPhoto = UIImage(data: imageData)
    }
}
