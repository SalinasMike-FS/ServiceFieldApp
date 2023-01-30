//
//  TruckDetailViewController.swift
//  ServiceField
//
//  Created by Natividad Michael Salinas II on 1/28/23.
//

import UIKit

protocol TruckDataDelegate: class {
    func updateTruckData(info: InventoryItem, idx: Int)
}
class TruckDetailViewController: UIViewController {
    
    var my_Inven: InventoryItem?
    var my_idx : Int?
    weak var delegate: TruckDataDelegate?
    @IBOutlet weak var txt_Type: UITextField!
    @IBOutlet weak var txt_Name: UITextField!
    @IBOutlet weak var txt_quantity: UITextField!
    @IBOutlet weak var txt_TruckNumber
    : UITextField!
//    init(truck: Truck) {
//            self.truck = truck
//            super.init(nibName: nil, bundle: nil)
//        }
//
//        required init?(coder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }

        override func viewDidLoad() {
            super.viewDidLoad()

            txt_Name.text = my_Inven?.name
            txt_quantity.text = "\(String(describing: my_Inven?.quantity))"
            txt_Type.text = my_Inven?.type
            txt_TruckNumber.text = "\(my_Inven?.truckNumber)"

            // set up constraints
        }
    
    @IBAction func Click_Cancel(_ sender: Any) {
        if let nav = self.navigationController {
                nav.popViewController(animated: true)
            } else {
                self.dismiss(animated: true, completion: nil)
            }
    }
    
    @IBAction func Click_save(_ sender: Any) {
        if let strqu = txt_quantity.text, let nquan = Int(strqu) {
            if let strtr = txt_TruckNumber.text, let ntruck = Int(strtr) {
                if let strname = txt_Name.text {
                    if let strType = txt_Type.text {
                        let cur_inven = InventoryItem(name: strname , quantity: nquan, type: strType, truckNumber: ntruck)
                        delegate?.updateTruckData(info: cur_inven, idx: my_idx!)
                    }
                        
                }
            }
        }
        
        if let nav = self.navigationController {
                nav.popViewController(animated: true)
            } else {
                self.dismiss(animated: true, completion: nil)
            }
    }
}
