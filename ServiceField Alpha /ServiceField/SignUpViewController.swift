//
//  SignUpViewController.swift
//  ServiceField
//
//  Created by Natividad Michael Salinas II on 1/14/23.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var userFirstName: UITextField!
    @IBOutlet weak var userLastName: UITextField!
    @IBOutlet weak var userAddress: UITextField!
    @IBOutlet weak var userCity: UITextField!
    @IBOutlet weak var userState: UITextField!
    @IBOutlet weak var userZipCode: UITextField!
    
   
        var user: User?
        var employee: Employee?
        var manager: Manager?

        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
    
    @IBAction func saveButton(_ sender: Any) {
		if userFirstName.text?.isEmpty == true || userLastName.text?.isEmpty == true || userAddress.text?.isEmpty == true || userCity.text?.isEmpty == true || userState.text?.isEmpty == true || userZipCode.text?.isEmpty == true {
        let alert = UIAlertController(title: "Error", message: "Please enter all fields", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    } else {
        let firstName = userFirstName.text ?? ""
        let lastName = userLastName.text ?? ""
        let address = userAddress.text ?? ""
        let city = userCity.text ?? ""
        let state = userState.text ?? ""
        let zipCode = userZipCode.text ?? ""

        let alert = UIAlertController(title: "Select User Type", message: "Are you an Employee or Manager?", preferredStyle: .alert)
		let employeeAction = UIAlertAction(title: "Employee", style: .default, handler: { action in
			self.employee = Employee(firstName: firstName, lastName: lastName, address: address, city: city, state: state, zipCode: zipCode, email: "", password: "", truckNumber: "")
			self.performSegue(withIdentifier: "showProfile", sender: self)
        })
        let managerAction = UIAlertAction(title: "Manager", style: .default, handler: { action in
            self.manager = Manager(firstName: firstName, lastName: lastName, address: address, city: city, state: state, zipCode: zipCode, email: "", password: "", department: "" )
            self.performSegue(withIdentifier: "showProfile", sender: self)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(employeeAction)
        alert.addAction(managerAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showProfile" {
                if let destinationVC = segue.destination as? ProfileViewController, let user = employee ?? manager {
                    destinationVC.user = user
                }
            }
        }
}
