//
//  AboutUsVC.swift
//  LightEcoPack
//
//  Created by Admin on 11.10.21.
//

import UIKit
import Firebase

class AboutUsVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var aboutUs = [AboutUs]()

    override func viewDidLoad() {
        super.viewDidLoad()

        Database.database().reference().observe(.value) {[weak self] (snapshot) in
                    guard let value = snapshot.value, snapshot.exists() else {
                        print("error")
                        return
                    }
                    guard let dict = value as? [String: Any],
                          let aboutUsInfo = dict["aboutUs"] as? [[String: Any]] else { return }
                    
                    let aboutUs = aboutUsInfo.compactMap({ AboutUs(dict: $0) })
                
                    self?.aboutUs = aboutUs
                    self?.collectionView.reloadData()
                    print(aboutUs)
                }
        collectionView.dataSource = self
        collectionView.delegate = self
        view.backgroundColor = UIColor(red: 217.0 / 255.0, green: 201.0 / 255.0, blue: 202.0 / 255.0, alpha: 1)
        collectionView.layer.borderWidth = 1.0
        collectionView.layer.borderColor = UIColor.gray.cgColor
    }
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return aboutUs.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AboutUsCollectionViewCell", for: indexPath) as? AboutUsCollectionViewCell
            cell?.setup(aboutUs: aboutUs[indexPath.row])
            return cell ?? UICollectionViewCell()
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width), height: 230.0)
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
