//
//  SingUpViewController.swift
//  Project1
//
//  Created by user230069 on 4/16/23.
//

import UIKit

class SingUpViewController: UIViewController {

    @IBOutlet weak var phonenumberTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!

    @IBOutlet weak var firstnameTextField: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        if phonenumberTextField.text?.isEmpty ?? true ||
                  usernameTextField.text?.isEmpty ?? true ||
                  passwordTextField.text?.isEmpty ?? true ||
                  emailTextField.text?.isEmpty ?? true ||
                  lastnameTextField.text?.isEmpty ?? true {
                
                  let alertController = UIAlertController(title: "Error", message: "Please fill in all fields.", preferredStyle: .alert)
                  let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                  alertController.addAction(okAction)
                  present(alertController, animated: true, completion: nil)
                  return
              }

              let user = User()
              user.firstname = firstnameTextField.text
              user.lastname = lastnameTextField.text
              user.username = usernameTextField.text
              user.password = passwordTextField.text
              user.email = emailTextField.text
              user.phoneNumber = Int(phonenumberTextField.text ?? "")

              let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
              homeVC.user = user
              navigationController?.pushViewController(homeVC, animated: true)
           }
    
}
    
    
	

	
