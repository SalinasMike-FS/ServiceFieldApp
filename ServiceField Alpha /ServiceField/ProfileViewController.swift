//
//  ProfileViewController.swift
//  ServiceField
//
//  Created by Natividad Michael Salinas II on 1/15/23.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = user {
            print(user.firstName)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToCreate" {
            if let destinationVC = segue.destination as? CreateAEventViewController{
                
                destinationVC.user = user ?? nil
            }
        }
//        if segue.identifier == "GoToCreate" {
//            _ = segue.destination as! TRCodeViewController
//            //get the T&R code information from firebase project "Service Field"
//            //pass the data to the destinationVC to create the tableView and display the series and codes
//        }
    }
    

    @IBAction func click_Inventory(_ sender: Any) {
        performSegue(withIdentifier: "GoToInventory", sender: self)
    }
    
    
}
