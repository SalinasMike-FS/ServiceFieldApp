//
//  LogInViewController.swift
//  ServiceField
//
//  Created by Natividad Michael Salinas II on 1/14/23.
//

import UIKit

class LogInViewController: UIViewController {
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    var users: [User] = []
    var loggedInUser : User?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func login_user(_ sender: Any) {
        let email = userEmail.text!
        let passd = userPassword.text!
        if email == "admin" && passd == "admin" {
            loggedInUser = User(firstName: "Mikel", lastName: "Lora", address: "2627 Stratford Park", city: "Bloomington", state: "NY", zipCode: "47404", email: "admin", password: "admin")
            self.performSegue(withIdentifier: "GotoProfile", sender: self)
            // navigate to the next screen
            
            
            
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "GotoProfile" {
                if let destinationVC = segue.destination as? ProfileViewController{
                    
                    destinationVC.user = loggedInUser ?? nil
                }
            }
        }
    @IBAction func exit_app(_ sender: Any) {
        exit(0)
    }
    
}
