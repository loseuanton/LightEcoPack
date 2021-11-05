//
//  PersonalAreaVC.swift
//  LightEcoPack
//
//  Created by Admin on 10.10.21.
//

import UIKit

class PersonalAreaVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet private weak var personalAreaTableView: UITableView!
    
    let color = UIColor(red: 217.0 / 255.0, green: 201.0 / 255.0, blue: 202.0 / 255.0, alpha: 1)
    
    private var profile = [Profile(logoPhoto: UIImage(systemName: "plus"), nameCompany: "", phoneNumber: "", country: "", email: "")] {
        didSet {
            personalAreaTableView.reloadData()
        }
    }
    private var cart = [Cart(cart: "Корзина")]
    private var offer = [Offer(offer: "Предложение")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personalAreaTableView.delegate = self
        personalAreaTableView.dataSource = self
        view.backgroundColor = color
        personalAreaTableView.backgroundColor = .lightGray
        
        
        
    }
    @IBAction func profileSettings() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(identifier: "ProfileSettingsVC") as! ProfileSettingsVC
        navigationController?.pushViewController(nextVC, animated: true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return profile.count
        } else if section == 1 {
            return cart.count
        } else {
            return offer.count
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as? ProfileTableViewCell
            cell?.setup(customer: profile[indexPath.row])
            cell?.backgroundColor = color
            cell?.layer.borderWidth = 1.0
            cell?.layer.borderColor = UIColor.gray.cgColor
            cell?.layer.cornerRadius = 15.0
            return cell ?? UITableViewCell()
        } else if indexPath.section == 1 {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as? CartTableViewCell
            cell2?.setup(cart: cart[indexPath.row])
            cell2?.backgroundColor = color
            cell2?.layer.borderWidth = 1.0
            cell2?.layer.borderColor = UIColor.gray.cgColor
            cell2?.layer.cornerRadius = 15.0
            return cell2 ?? UITableViewCell()
        } else {
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "OfferTableViewCell", for: indexPath) as? OfferTableViewCell
            cell3?.setup(offer: offer[indexPath.row])
            cell3?.backgroundColor = color
            cell3?.layer.borderWidth = 1.0
            cell3?.layer.borderColor = UIColor.gray.cgColor
            cell3?.layer.cornerRadius = 15.0
            return cell3 ?? UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return ProfileTableViewCell.rowHeight
        } else  if indexPath.section == 1{
            return CartTableViewCell.rowHeight
        } else {
            return OfferTableViewCell.rowHeight
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let nextVC = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "CartVC") as? CartVC)!
            navigationController?.pushViewController(nextVC, animated: true)
            
        } else if indexPath.section == 2 {
            let nextVC2 = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "OfferVC") as? OfferVC)!
            navigationController?.pushViewController(nextVC2, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }
    
    
}


