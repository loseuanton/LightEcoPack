//
//  ProductsVC.swift
//  LightEcoPack
//
//  Created by Admin on 8.10.21.
//

import UIKit

class ProductsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var colorBg = UIColor(red: 217.0 / 255.0, green: 201.0 / 255.0, blue: 202.0 / 255.0, alpha: 1)
    var colorTV = UIColor(red: 230.0 / 255.0, green: 201.0 / 255.0, blue: 202.0 / 255.0, alpha: 1)
    
    @IBOutlet private weak var tableView: UITableView!

    var category: Category!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = colorBg

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell", for: indexPath) as? ProductsTableViewCell
        cell?.setup(with: category.products[indexPath.row])
        cell?.backgroundColor = colorTV
        cell?.layer.borderWidth = 1.0
        cell?.layer.borderColor = UIColor.gray.cgColor
        cell?.layer.cornerRadius = 15.0
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ProductsTableViewCell.rowHeight

        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = category.products[indexPath.row]
        openInfo(with: product)
    }
    private func openInfo(with products: Product) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(identifier: "ProductInfoVC") as? ProductInfoVC
        nextVC?.product = products
        present(nextVC!, animated: true, completion: nil)
    }
    

}

