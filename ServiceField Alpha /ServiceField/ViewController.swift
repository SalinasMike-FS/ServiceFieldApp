//
//  ViewController.swift
//  ServiceField
//
//  Created by Natividad Michael Salinas II on 1/4/23.
//

import UIKit
import FirebaseDatabase
var Users_info = [User]()

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        if let path = Bundle.main.path(forResource: "user_info", ofType: ".json"){
//            let url = URL(fileURLWithPath: path)
//            do{
//                let data = try Data.init(contentsOf: url)
//                Users_info = try JSONDecoder().decode([User].self, from: data)
//            }
//            catch{
//                print(error.localizedDescription)
//            }
//        }
//        if Users_info.count == 0 {
//            var ref: DatabaseReference!
//            ref = Database.database().reference()
//            //let userID = Auth.auth().currentUser?.uid
//
//            ref.child("users").observe(.value, with: { snapshot in
//              // Get user value
//                for user_ in snapshot.children {
//                    //let value = snapshot.value as? NSDictionary
//                    //let username = value?["username"] as? String ?? ""
//                    //let user = User(username: username)
//                    let cur = user_ as? User ?? nil
//                    if cur != nil
//                    {
//                        Users_info.append(cur!)
//                    }
//                }
//
//            }) { error in
//              print(error.localizedDescription)
//            }
//        }
        
        
    }

    @IBAction func exit_app(_ sender: Any) {
        exit(0)
    }
    
}

