//
//  CodeDetailsViewController.swift
//  ServiceField
//
//  Created by Natividad Michael Salinas II on 1/28/23.
//

import UIKit

class CodeDetailsViewController: UIViewController {

    @IBOutlet weak var txt_Description: UITextView!
    @IBOutlet weak var txt_Pre: UITextField!
    @IBOutlet weak var txt_Expiration: UITextField!
    @IBOutlet weak var txt_Type: UITextField!
    @IBOutlet weak var txt_Title: UITextField!
    var mycode : Code?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAndParseJSON()

        // Do any additional setup after loading the view.
    }
    @IBAction func Click_back(_ sender: Any) {
        if let nav = self.navigationController {
                nav.popViewController(animated: true)
            } else {
                self.dismiss(animated: true, completion: nil)
            }
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
                        if code_id == mycode?.code {
                            let code_info = data.value as! [String: String]
                            txt_Title.text = code_info["Title"]
                            txt_Type.text = code_info["Type"]
                            txt_Expiration.text = code_info["Expiration"]
                            txt_Description.text = code_info["Description"]
                            txt_Pre.text = code_info["Prerequisite"]
                        }
                        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
