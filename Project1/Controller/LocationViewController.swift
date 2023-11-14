//
//  LocationViewController.swift
//  Project1
//
//  Created by Cacttus Education on 6.6.23.
//

import UIKit
import MapKit

class LocationViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the delegate
        
               
               let locationCoordinate = CLLocationCoordinate2D(latitude: 12.9822519, longitude: 77.6393013)
               let annotation = MKPointAnnotation()
               annotation.coordinate = locationCoordinate
               annotation.title = "Grill & The Goat - Exotic Multi Cuisine"
               annotation.subtitle = "Indiranagar neighborhood"
               mapView.addAnnotation(annotation)

               let region = MKCoordinateRegion(center: locationCoordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
               mapView.setRegion(region, animated: true)
           }
           
           // MKMapViewDelegate method to customize the annotation view if needed
           func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
               let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
               annotationView.pinTintColor = .red
               annotationView.canShowCallout = true
               return annotationView
           }
    @IBAction func typeMaps(_ sender: Any) {
        if let segmentedControl = sender as? UISegmentedControl {
               if segmentedControl.selectedSegmentIndex == 0 {
                   mapView.mapType = .standard
               } else if segmentedControl.selectedSegmentIndex == 1 {
                   mapView.mapType = .hybrid
               } else if segmentedControl.selectedSegmentIndex == 2 {
                   mapView.mapType = .satellite
               }
           }
    }
}

