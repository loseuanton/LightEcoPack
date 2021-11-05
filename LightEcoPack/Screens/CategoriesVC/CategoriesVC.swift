//
//  CategoriesVC.swift
//  LightEcoPack
//
//  Created by Admin on 8.10.21.
//

import UIKit
import Firebase
import FirebaseDatabase

class CategoriesVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var colorBg = UIColor(red: 217.0 / 255.0, green: 201.0 / 255.0, blue: 202.0 / 255.0, alpha: 1)
    var colorCV = UIColor(red: 250.0 / 255.0, green: 201.0 / 255.0, blue: 202.0 / 255.0, alpha: 1)
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var categories = [Category]()

    override func viewDidLoad() {
        super.viewDidLoad()

        Database.database().reference().observe(.value) {[weak self] (snapshot) in
                    guard let value = snapshot.value, snapshot.exists() else {
                        print("error")
                        return
                    }
                    guard let dict = value as? [String: Any],
                          let categoriesInfo = dict["categories"] as? [[String: Any]] else { return }
                    
                    let categories = categoriesInfo.compactMap({ Category(dict: $0) })
                
                    self?.categories = categories
                    self?.collectionView.reloadData()
                    print(categories)
                }
        collectionView.dataSource = self
        collectionView.delegate = self
        view.backgroundColor = colorBg
        collectionView.backgroundColor = colorBg
//

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width) / 2 - 20, height: 230.0)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as? CategoriesCollectionViewCell
        cell?.setup(with: categories[indexPath.row])
        cell?.backgroundColor = colorCV
        cell?.layer.borderWidth = 1.0
        cell?.layer.borderColor = UIColor.gray.cgColor
        cell?.layer.cornerRadius = 15.0
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = categories[indexPath.row]
        let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductsVC") as? ProductsVC

        nextVC?.category = category
        navigationController?.pushViewController(nextVC!, animated: true)

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    }
}
