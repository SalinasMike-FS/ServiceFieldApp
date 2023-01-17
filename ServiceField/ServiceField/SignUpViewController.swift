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
    
   
    var user: User
      var employee: Employee
      var manager: Manager
    
    required init?(coder: NSCoder) {
        self.user = User(firstName: "", lastName: "", address: "", city: "", state: "", zipCode: "")
        self.employee = Employee(firstName: "", lastName: "", address: "", city: "", state: "", zipCode: "", truckNumber: "")
        self.manager = Manager(firstName: "", lastName: "", address: "", city: "", state: "", zipCode: "", department: "")
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    


    @IBAction func saveButton(_ sender: Any) {
        
        let firstName = userFirstName.text ?? ""
            let lastName = userLastName.text ?? ""
            let address = userAddress.text ?? ""
            let city = userCity.text ?? ""
            let state = userState.text ?? ""
            let zipCode = userZipCode.text ?? ""
            user = User(firstName: firstName, lastName: lastName, address: address, city: city, state: state, zipCode: zipCode)
            employee = Employee(firstName: firstName, lastName: lastName, address: address, city: city, state: state, zipCode: zipCode, truckNumber: "")
            manager = Manager(firstName: firstName, lastName: lastName, address: address, city: city, state: state, zipCode: zipCode, department: "")
     
        performSegue(withIdentifier: "showProfile", sender: self)
    }

//    @IBSegueAction func showProfile(_ coder: NSCoder) -> UIViewController? {
//        return UIViewController(coder: coder)
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProfile" {
            if let destinationVC = segue.destination as? ProfileViewController {
                destinationVC.user = user
            }
           
        }
    }

    
}
