//
//  TRCodeViewController.swift
//  ServiceField
//
//  Created by Natividad Michael Salinas II on 1/28/23.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase
import Foundation
struct Serie {
    var name: String
    var codes: [Code]
}

struct Code {
    var code: String
    var addedDate: Date
}
class TRCodeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
        
        var series = [Serie]()
        var codes = [Code]()
        var loggedInUser : User?
    
        override func viewDidLoad() {
            super.viewDidLoad()
            loadCodesFromFirebase()
            self.tableView.dataSource = self
            self.tableView.delegate = self
        }
        
        func loadCodesFromFirebase() {
            // Make a call to the Firebase "Service Field" project to get the T&R code information
            // Use the snapshot to extract the data and store it in the series and codes arrays
            var ref: DatabaseReference!
            ref = Database.database().reference()
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "yyyy-MM-DD"
            ref.child("users/Mikel").getData(completion:  { error, snapshot in
              guard error == nil else {
                print(error!.localizedDescription)
                return;
              }
                let data1 = snapshot?.value as? NSDictionary
                let data = data1?["Mikel"] as? NSDictionary
                do{
                    if data1 != nil {
                        for (key , value ) in data1! {
                            let strCode = key as? String ?? ""
                            let strDate = value as? String ?? ""
                            let curDate = dateformatter.date(from: strDate) ?? Date()
                            self.codes.append(Code(code: strCode, addedDate:curDate))
                        }
                    }
                    
                } catch  {
                    print(error.localizedDescription)
                }
                
                self.tableView.reloadData()
            });
            
            
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showCodeDetails" {
                let destinationVC = segue.destination as! CodeDetailsViewController
                destinationVC.mycode = sender as? Code
            }
        }
    }

    extension TRCodeViewController: UITableViewDataSource {
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
//        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//            return series[section].name
//        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return codes.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "codeCell", for: indexPath)
            let code = codes[indexPath.row]
            cell.textLabel?.text = code.code

            // Check if the person is logged in and if they have the code
            if let loggedInUser = loggedInUser, loggedInUser.codes.contains(code.code) {
                let daysSinceAdded = calculateDaysSinceAdded(code.addedDate)
                if daysSinceAdded <= 30 {
                    cell.backgroundColor = .green
                } else if daysSinceAdded <= 60 {
                    cell.backgroundColor = .yellow
                } else {
                    cell.backgroundColor = .red
                }
            } else {
                cell.backgroundColor = .gray
            }

            return cell
        }
        


        func calculateDaysSinceAdded(_ addedDate: Date) -> Int {
            let calendar = Calendar.current
            let today = Date()
            let daysSinceAdded = calendar.dateComponents([.day], from: addedDate, to: today).day
            return daysSinceAdded ?? 0
        }
    }

    extension TRCodeViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let code = codes[indexPath.row]
            performSegue(withIdentifier: "showCodeDetails", sender: code)
        }

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




