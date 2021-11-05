//
//  ProfileTableViewCell.swift
//  LightEcoPack
//
//  Created by Admin on 10.10.21.
//

import UIKit

//struct  Profile {
//    var logoPhoto: UIImage?
//    var nameCompany: String
//    var phoneNumber: String
//    var country: String
//    var email: String
//}

class ProfileTableViewCell: UITableViewCell {

    static let rowHeight: CGFloat = 350
    
    @IBOutlet private weak var logoPhoto: UIImageView!
    @IBOutlet private weak var nameCompany: UILabel!
    @IBOutlet private weak var phoneNumber: UILabel!
    @IBOutlet private weak var country: UILabel!
    @IBOutlet private weak var email: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        loadSaveData()
    }
    
    func setup(customer: Profile) {
        
        logoPhoto.image = customer.logoPhoto
        nameCompany.text = customer.nameCompany
        phoneNumber.text = customer.phoneNumber
        country.text = customer.country
        email.text = customer.email
        
    }
    private func loadSaveData() {
            let defaults = UserDefaults.standard
            if let profileData = defaults.data(forKey: "profileData") {
                let profile = try? JSONDecoder().decode(Profile.self, from: profileData)
                logoPhoto.image = profile?.logoPhoto
                nameCompany.text = profile?.nameCompany
                phoneNumber.text = profile?.phoneNumber
                country.text = profile?.country
                email.text = profile?.email
    
            }
    
    

}
}
