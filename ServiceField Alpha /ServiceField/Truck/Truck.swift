//
//  Truck.swift
//  ServiceField
//
//  Created by Natividad Michael Salinas II on 1/28/23.
//

import Foundation

class Truck {
    var number: String
    var assignedEmployee: Employee
    var inventory: [InventoryItem]
    
    init(number: String, assignedEmployee: Employee) {
        self.number = number
        self.assignedEmployee = assignedEmployee
        self.inventory = []
    }
}
