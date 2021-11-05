//
//  ContactVC.swift
//  LightEcoPack
//
//  Created by Admin on 11.10.21.
//

import UIKit
import MapKit

class ContactVC: UIViewController {
    
    @IBOutlet private weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let annontation = MKPointAnnotation()
        annontation.coordinate = CLLocationCoordinate2D(latitude: 38.897957, longitude: -77.036560)
        annontation.title = "The White House"
        annontation.subtitle = "Trumps House"
        mapView.addAnnotation(annontation)
        
        let region = MKCoordinateRegion(center: annontation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
    }
    

   

}
