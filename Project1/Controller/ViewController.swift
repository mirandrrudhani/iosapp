//
//  ViewController.swift
//  Project1
//
//  Created by user230069 on 4/9/23.
//

import UIKit

class ViewController: UIViewController {
    var user = User()
    @IBOutlet weak var usernameTextField: UITextField!
 
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       			
    }
    
    @IBAction func buttonLoginTapped(_ sender: Any) {
        
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
              if username.isEmpty || password.isEmpty {
                  let alertController = UIAlertController(title: "Error", message: "Please enter both username and password.", preferredStyle: .alert)
                  let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                  alertController.addAction(okAction)
                  present(alertController, animated: true, completion: nil)
                  return
              }
        user.username = username
        user.password = password
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoHome" {
           
            
         if let homeViewController = segue.destination as? HomeViewController {
            homeViewController.user = user
        }
       }
    }
}
