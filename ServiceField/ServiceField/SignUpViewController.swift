//
//  SignUpViewController.swift
//  ServiceField
//
//  Created by Natividad Michael Salinas II on 1/14/23.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func saveButton(_ sender: Any) {
     
        performSegue(withIdentifier: "showProfile", sender: self)
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showProfile" {
//            let destinationVC = segue.destination as! ProfileViewController
//            destinationVC.user = currentUser
//        }
//    }

    
}
