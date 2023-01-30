//
//  CreateAEventViewController.swift
//  ServiceField
//
//  Created by Natividad Michael Salinas II on 1/28/23.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase
import Foundation

class CreateAEventViewController: UIViewController {

    @IBOutlet weak var user_date: UIDatePicker!
    @IBOutlet weak var userDate: UITextField!
    @IBOutlet weak var userJobNumber: UITextField!
    @IBOutlet weak var userJobType: UITextField!
    @IBOutlet weak var userTechLead: UITextField!
    @IBOutlet weak var userRevenue: UITextField!
    @IBOutlet weak var userCode1: UITextField!
    @IBOutlet weak var userCode2: UITextField!
    @IBOutlet weak var userCode3: UITextField!
    
    var user: User?
    
    override func viewDidLoad() {
            super.viewDidLoad()
            //loadAndParseJSON()
        }
        
        func loadAndParseJSON() {
            // Load the JSON data from the file
            if let path = Bundle.main.path(forResource: "T&R Codes", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                    if let jsonResult = jsonResult as? [String: Any], let series = jsonResult["Series"] as? [String: Any], let codes = series["1000"] as? [String: Any], let code_data = codes["Codes"] as? [String: Any]{
                        // Parse
                        for data in code_data {
                            let code_id = data.key as String
                            let code_info = data.value as! [String: String]
                        }
//                        for serie in series {
//                            if let codes = serie["Codes"] as? [[String: Any]] {
//                                for code in codes {
//                                    if let title = code["Title"] as? String,
//                                        let type = code["Type"] as? String,
//                                        let expiration = code["Expiration"] as? String,
//                                        let description = code["Description"] as? String,
//                                        let prerequisite = code["Prerequisite"] as? String {
//                                        // Use the parsed data here
//                                        print("Title: \(title)")
//                                        print("Type: \(type)")
//                                        print("Expiration: \(expiration)")
//                                        print("Description: \(description)")
//                                        print("Prerequisite: \(prerequisite)")
//                                    }
//                                }
//                            }
//                        }
                    }
                } catch {
                    // Handle the error
                    print(error)
                }
            }
        }
    
    @IBAction func TRCodeViewButton(_ sender: Any) {
        //performSegue(withIdentifier: "showT&RCode", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showT&RCode" {
            if let destinationVC = segue.destination as? TRCodeViewController{
                
                destinationVC.loggedInUser = user ?? nil
            }
           // _ = segue.destination as! TRCodeViewController
            //get the T&R code information from firebase project "Service Field"
            //pass the data to the destinationVC to create the tableView and display the series and codes
        }
    }
    
    
    @IBAction func addEventButton(_ sender: Any) {
        var ref: DatabaseReference!
        var codes = [Code]()
        ref = Database.database().reference()
//        ref.child("series").observe(.value, with: { snapshot in
//            if snapshot.exists() {
//                for user_ in snapshot.children {
//                    //let value = snapshot.value as? NSDictionary
//                    //let username = value?["username"] as? String ?? ""
//                    //let user = User(username: username)
//                    let cur = user_ as? Code ?? nil
//                    if cur != nil
//                    {
//                        codes.append(cur!)
//                    }
//                }
//            }
//            else {
//                ref.setValue(["series": []])
//            }
//          // Get user value
//
//
//        }) { error in
//          print(error.localizedDescription)
//            ref.setValue(["series": []])
//        }
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-DD"
        let strDate = dateformatter.string(from: user_date.date)
//        codes.append({code: userCode1.text!, addedDate: user_date.date))
//        codes.append(Code(code: userCode2.text!, addedDate: user_date.date))
//        codes.append(Code(code: userCode3.text!, addedDate: user_date.date))
        //ref.child("series").setValue([userCode1.text! : strDate])
        do {
            ref.child("users").child("Mikel").setValue([userCode1.text!: strDate,userCode2.text!: strDate,userCode3.text!: strDate])
        } 
            
        catch  {
            print(error.localizedDescription)
            
           
        }
        
//        ref.child("users").child(userCode2.text!).setValue(["date": strDate])
//        ref.child("users").child(userCode3.text!).setValue(["date": strDate])
        //self.ref.child("series").set.child(user.uid).up setValue(["username": username])
        
    }
}


        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


