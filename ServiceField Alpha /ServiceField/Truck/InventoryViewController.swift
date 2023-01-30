//
//  InventoryViewController.swift
//  ServiceField
//
//  Created by Natividad Michael Salinas II on 1/28/23.
//

import UIKit

class InventoryViewController: UIViewController ,TruckDataDelegate  {
    
    @IBOutlet weak var tableview: UITableView!
    var truck: Truck?
    var inventory = [InventoryItem]()
    var cur_Idx : Int?
    
    //        init(truck: Truck) {
    //            self.truck = truck
    //            super.init(style: .plain)
    // }
    
    //        required init?(coder: NSCoder) {
    //            fatalError("init(coder:) has not been implemented")
    //        }
    
    @IBOutlet weak var click_back: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //title = "Inventory for Truck \(truck.number)"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addInventory))
        loadInventory()
        self.tableview.dataSource = self
        self.tableview.delegate = self
    }
    func updateTruckData(info: InventoryItem, idx: Int) {
        inventory[idx] = info
        self.tableview.reloadData()
    }
    func loadInventory() {
        if let path = Bundle.main.path(forResource: "inventory", ofType: "json") {
            let url = URL(fileURLWithPath: path)
            do{
                let data = try Data.init(contentsOf: url)
                inventory = try JSONDecoder().decode([InventoryItem].self, from: data)
                self.tableview.reloadData()

            }
            catch{
                print(error.localizedDescription)
                
               
            }
        }
    }
    
    @IBAction func Click_Back(_ sender: Any) {
        //navigationController?.popViewController(animated: true)
        if let nav = self.navigationController {
                nav.popViewController(animated: true)
            } else {
                self.dismiss(animated: true, completion: nil)
            }
    }
    @objc func addInventory() {
           let alert = UIAlertController(title: "Add Inventory Item", message: nil, preferredStyle: .alert)
           
           alert.addTextField { (textField) in
               textField.placeholder = "Name"
           }
           alert.addTextField { (textField) in
               textField.placeholder = "Quantity"
               textField.keyboardType = .numberPad
           }
           alert.addTextField { (textField) in
               textField.placeholder = "Type (part or tool)"
           }
           
           let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
               guard let self = self else { return }
               let name = alert.textFields?[0].text ?? ""
               let quantity = Int(alert.textFields?[1].text ?? "") ?? 0
               let type = alert.textFields?[2].text ?? ""
               
               let item = InventoryItem(name: name, quantity: quantity, type: type, truckNumber: Int(self.truck!.number) ?? 0)
               self.inventory.append(item)
               
               //self.saveInventory()
               //self.tableView.()
           }
           
           let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
           alert.addAction(addAction)
           alert.addAction(cancelAction)
           present(alert, animated: true, completion: nil)
       }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "showInventoryDetail" {
                    let destinationVC = segue.destination as! TruckDetailViewController
                    destinationVC.my_Inven = sender as? InventoryItem
                    destinationVC.my_idx = cur_Idx
                }
            }
    }
extension InventoryViewController : UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inventory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value2, reuseIdentifier: "InventoryCell")
//        let cell = tableView.dequeueReusableCell(style: .value2, withIdentifier: "InventoryCell", for: indexPath)
        let item = inventory[indexPath.row]
        cell.textLabel?.text = item.name
        
        
        cell.detailTextLabel?.text = "Quantity: \(item.quantity)  Type: \(item.type)"
        return cell
    }
}
    
extension InventoryViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let cur_inven = inventory[indexPath.row]
            cur_Idx = indexPath.row
            performSegue(withIdentifier: "showInventoryDetail", sender: cur_inven)
        }

        // Do any additional setup after loading the view.
    }

    // MARK: - Table view data source

    

    

