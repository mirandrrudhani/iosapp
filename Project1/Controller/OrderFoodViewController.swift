//
//  OrderFoodViewController.swift
//  Project1
//
//  Created by Cacttus Education on 6.6.23.
//

import UIKit


class OrderFoodViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
 
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func pickFoodButton(_ sender: Any) {
        let imagePicker = UIImagePickerController()
                imagePicker.sourceType = .photoLibrary
                imagePicker.delegate = self
                present(imagePicker, animated: true, completion: nil)
            }
            
            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                if let selectedImage = info[.originalImage] as? UIImage {
                    imageView.image = selectedImage
                }
                
                picker.dismiss(animated: true, completion: nil)
            }
            
            func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                picker.dismiss(animated: true, completion: nil)
            }
    

}
