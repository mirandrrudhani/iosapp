//
//  ProfileViewController.swift
//  Project1
//
//  Created by Cacttus Education on 7.6.23.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.layer.cornerRadius = min(imageView.frame.width, imageView.frame.height) / 2.0
        imageView.clipsToBounds = true
        
               let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture))
               self.view.addGestureRecognizer(tapGesture)
           }

           @objc func tapGesture() {
               if imageView.image == UIImage(named: "profilepic") {
                   imageView.image = UIImage(named: "kozi")
               } else {
                   imageView.image = UIImage(named: "profilepic")
               }
           }
    

}
