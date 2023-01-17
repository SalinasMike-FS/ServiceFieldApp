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
    

    
}
